import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../widgets/winner_item.dart';
import 'logic.dart';
import 'state.dart';

class ParticipatedPage extends StatelessWidget {
  ParticipatedPage({Key? key}) : super(key: key);

  final ParticipatedLogic logic = Get.put(ParticipatedLogic());
  final ParticipatedState state = Get.find<ParticipatedLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: Get.height,
        padding: EdgeInsets.only(
          top: 40,
          right: Get.width * 0.05,
          left: Get.width * 0.05,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/bg_two.png'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      'assets/arrow_back.png',
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Image(
                  image: AssetImage('assets/stars.png'),
                  width: Get.width * 0.8,
                ),
              ),
              Transform.translate(
                offset: Offset(0, -20),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/crown.png'),
                    width: 180,
                    height: 180,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Congratulations!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Get.width * 0.09,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(text: 'You Have Successfully Participated For'),
                    TextSpan(
                      text: ' ₹100 ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(text: 'Choose in Starting'),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Image.asset(
                      'assets/line_left.png',
                      fit: BoxFit.contain,
                      height: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    ' Time ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 3,
                    child: Image.asset(
                      'assets/line_right.png',
                      fit: BoxFit.contain,
                      height: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white.withOpacity(0.3),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/get_phone.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.winners);
                },
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/get_button.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
