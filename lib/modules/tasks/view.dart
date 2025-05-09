import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes/routes.dart';
import '../../widgets/custom_box.dart';
import '../../widgets/custom_button.dart';
import 'logic.dart';
import 'state.dart';

class TasksPage extends StatefulWidget {
  TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final TasksLogic logic = Get.put(TasksLogic());

  final TasksState state = Get.find<TasksLogic>().state;

  Set<int> completedIndexes = {};

  bool isEveryTrue = false;
  List<bool> taskStatuses = List.generate(6, (_) => false);

  @override
  void initState() {
    super.initState();
    loadShareStatus();
  }

  Future<void> loadShareStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList('task_statuses');
    if (stored != null && stored.length == 6) {
      setState(() {
        taskStatuses = stored.map((e) => e == 'true').toList();
      });
    }

    isEveryTrue = prefs.getBool('task_statuses_every_true') ?? true;
  }

  Future<void> saveShareStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'task_statuses',
      taskStatuses.map((e) => e.toString()).toList(),
    );

    isEveryTrue = taskStatuses.every((e) => e == true);

    await prefs.setBool(
      'task_statuses_every_true',
      isEveryTrue,
    );
    setState(() {});
  }

  Future<void> openWebsiteAndTrack(int index) async {
    final Uri url = Uri.parse('https://flutter.dev/');
    if (await canLaunchUrl(url)) {
      final DateTime startTime = DateTime.now();
      await launchUrl(url);

      await Future.delayed(Duration(seconds: 5));

      final DateTime endTime = DateTime.now();
      final difference = endTime.difference(startTime).inSeconds;

      if (difference >= 5) {
        setState(() {
          taskStatuses[index] = true;
        });
        await saveShareStatus();
      } else {
        Get.snackbar(
          "Task Incomplete",
          "You must stay for at least 30 seconds!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        padding: EdgeInsets.only(
          right: Get.width * 0.05,
          left: Get.width * 0.05,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/bg_one.png'), fit: BoxFit.cover)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Image(
                      image: AssetImage('assets/arrow_back.png'),
                      width: 25,
                      height: 25,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'COIN KUBER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Rubik',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Complete all tasks carefully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Get.width * 0.04,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Rubik',
                ),
              ),
              SizedBox(
                height: Get.height * 0.78,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.82
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return CustomBox(
                      index: index,
                      isTask: true,
                      label: 'Task ${index + 1}',
                      onTap: () {
                        if (index > 0 && !taskStatuses[index - 1]) {
                          Get.snackbar(
                            'Error',
                            "Please complete Task $index first",
                            backgroundColor: Colors.red,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          return;
                        }

                        openWebsiteAndTrack(index);
                      },
                      isGradient: taskStatuses[index],
                      image: 'assets/task.png',
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.address);
                },
                label: 'Continue',
                showIcon: false,
                isClickable: isEveryTrue,
                textColor: Colors.black,
                bgColor: isEveryTrue ? Color(0xFF9AD942) : Color(0xFFD0D0D0),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
