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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 40,
          right: Get.width * 0.05,
          left: Get.width * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 150,),
            Column(
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
                            fontSize: 20,
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
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  onTap: () {},
                  label: 'Got it!',
                  isClickable: true,
                  showIcon: false,
                ),
                const SizedBox(height: 20),
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
                      border: Border.all(
                        color: Color(0xFF9AD942),
                        width: 2,
                      ),
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
          ],
        ),
      ),
    );
  }
}
