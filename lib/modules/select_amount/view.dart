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
