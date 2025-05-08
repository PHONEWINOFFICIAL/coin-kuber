import 'package:coin_kuber_new/routes/routes.dart';
import 'package:coin_kuber_new/widgets/select_money.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class SelectAmountPage extends StatelessWidget {
  SelectAmountPage({super.key});

  final SelectAmountLogic logic = Get.put(SelectAmountLogic());
  final SelectAmountState state = Get.find<SelectAmountLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: EdgeInsets.only(
            top: 40,
            right: Get.width * 0.05,
            left: Get.width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width,
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
              const SizedBox(height: 20),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/banner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Choose Amount From Given 8 Options',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Get.width * 0.045,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Rubik',
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 230,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.getAmount,
                            arguments: {'amount': '₹1000', 'image': 'assets/rs_500.png'},
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Image(
                                image: AssetImage('assets/paytm_card.png'),
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                bottom: 27,
                                left: 0,
                                right: 0,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Get ₹1000',
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.getAmount,
                            arguments: {'amount': '₹2000', 'image': 'assets/rs_500.png'},
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Image(
                                image: AssetImage('assets/paypal_card.png'),
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                bottom: 17,
                                left: 0,
                                right: 0,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Get ₹2000',
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Color(0xFFCACACA), height: 2),
              const SizedBox(height: 20),
              SelectMoney(
                isSelectable: true,
                amount: '₹50',
                image: 'assets/rs_50.png',
                onTap: () {
                  Get.toNamed(
                    AppRoutes.getAmount,
                    arguments: {'amount': '₹50', 'image': 'assets/rs_50.png'},
                  );
                },
              ),
              SelectMoney(
                isSelectable: true,
                amount: '₹100',
                image: 'assets/rs_100.png',
                onTap: () {
                  Get.toNamed(
                    AppRoutes.getAmount,
                    arguments: {'amount': '₹100', 'image': 'assets/rs_100.png'},
                  );
                },
              ),
              SelectMoney(
                isSelectable: true,
                amount: '₹200',
                image: 'assets/rs_200.png',
                onTap: () {
                  Get.toNamed(
                    AppRoutes.getAmount,
                    arguments: {'amount': '₹200', 'image': 'assets/rs_200.png'},
                  );
                },
              ),
              SelectMoney(
                isSelectable: true,
                amount: '₹500',
                image: 'assets/rs_500.png',
                onTap: () {
                  Get.toNamed(
                    AppRoutes.getAmount,
                    arguments: {'amount': '₹500', 'image': 'assets/rs_500.png'},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
