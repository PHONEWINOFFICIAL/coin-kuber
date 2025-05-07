import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/note_item.dart';
import '../../widgets/select_money.dart';
import 'logic.dart';
import 'state.dart';

class TaskExplanationPage extends StatefulWidget {
  const TaskExplanationPage({super.key});

  @override
  State<TaskExplanationPage> createState() => _TaskExplanationPageState();
}

class _TaskExplanationPageState extends State<TaskExplanationPage> {
  final TaskExplanationLogic logic = Get.put(TaskExplanationLogic());

  final TaskExplanationState state = Get.find<TaskExplanationLogic>().state;

  late String image;

  @override
  void initState() {
    super.initState();
    final arguments = Get.arguments as Map<String, dynamic>;
    image = arguments['image'] ?? "";
  }

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
            const SizedBox(height: 20),
            SelectMoney(
              isSelectable: false,
              amount: '0',
              image: image,
              onTap: () {},
            ),
            const SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Share and Explain',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Get.width * 0.055,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Rubik',
                  letterSpacing: 0.0,
                ),
              ),
            ),
            const SizedBox(height: 20),
            NoteItem(
              image: 'assets/share.png',
              heading: 'Share',
              desc:
              'Aage Aapse Apka Number Pucha jayega,Shi Number Dalna hai, Usi Number pr Apko Bheja jayegWhatsApp pr apne 5 friends ko share krna hai.',
            ),
            NoteItem(
              image: 'assets/install.png',
              heading: 'Install',
              desc:
              'Apne dosto ko share krne ke bad main iske bare main batana h or app Ko Install krwana hai.',
            ),
            NoteItem(
              image: 'assets/important.png',
              heading: 'Important',
              desc:
              'Yadi aap ache se 5 dosto ko share nhi krte ho to aap paise nhi jeet paoge.',
            ),
            const Spacer(),
            CustomButton(
              onTap: () {
                Get.toNamed(
                  AppRoutes.shareWhatsapp,
                );
              },
              label: 'WhatsApp Share',
              showIcon: true,
              isClickable: true,
              icon: 'assets/whatsapp.png',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
