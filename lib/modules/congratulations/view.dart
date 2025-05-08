import 'package:coin_kuber_new/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class CongratulationsPage extends StatelessWidget {
  CongratulationsPage({super.key});

  final CongratulationsLogic logic = Get.put(CongratulationsLogic());
  final CongratulationsState state = Get.find<CongratulationsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.only(
            top: 40,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg_two.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: Get.height * 0.08,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 400,
                  width: Get.width,
                  child: Image(image: AssetImage('assets/celebrations.png')),
                ),
              ),
              Positioned(
                top: Get.height * 0.2,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 230,
                  width: 230,
                  child: Image(image: AssetImage('assets/circle.png'),),
                ),
              ),
              Positioned(
                top: Get.height * 0.17,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 300,
                  width: 200,
                  child: Image(image: AssetImage('assets/balloons.png')),
                ),
              ),
              Positioned(
                top: Get.height * 0.4,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 35),
                        width: Get.width,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/congratulations_bg.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '₹5,000',
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 60,
                                  color: Color(0xFF9AD942),
                                ),
                              ),
                              Text(
                                'CONGRATULATIONS FOR\nYOUR WINNING',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Amount will be credited to your account, as per the payment details provided, within the next 24 hours.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: Column(
                    children: [
                      CustomButton(
                        onTap: () {},
                        label: 'Got it!',
                        isClickable: true,
                        showIcon: false,
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          // Handle tap
                        },
                        child: Container(
                          width: Get.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFF9AD942), width: 2),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Join Another Contest',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF9AD942),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
