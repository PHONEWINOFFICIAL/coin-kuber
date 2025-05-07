import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../widgets/custom_box.dart';
import '../../widgets/custom_button.dart';
import 'logic.dart';
import 'state.dart';

class TasksPage extends StatelessWidget {
  TasksPage({Key? key}) : super(key: key);

  final TasksLogic logic = Get.put(TasksLogic());
  final TasksState state = Get.find<TasksLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        padding: EdgeInsets.only(
          top: 40,
          right: Get.width * 0.05,
          left: Get.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                      label: 'Task ${index + 1}',
                      onTap: () {
                        Get.toNamed(AppRoutes.taskExplanation);
                      },
                      isGradient: true,
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
                isClickable: true,
                textColor: Colors.black,
                bgColor: Color(0xFFD0D0D0),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

}
