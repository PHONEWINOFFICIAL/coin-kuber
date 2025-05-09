import 'package:coin_kuber_new/widgets/winner_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import 'logic.dart';
import 'state.dart';

class WinnersPage extends StatelessWidget {
  WinnersPage({super.key});

  final WinnersLogic logic = Get.put(WinnersLogic());
  final WinnersState state = Get.find<WinnersLogic>().state;

  final List<Map<String, String>> winnersList = [
    {
      'image': 'assets/person_1.png',
      'name': 'Shiva',
      'amount': '₹5,000',
    },
    {
      'image': 'assets/person_2.png',
      'name': 'Ram',
      'amount': '₹2,000',
    },
    {
      'image': 'assets/person_3.png',
      'name': 'Piyush',
      'amount': '₹1,000',
    },
    {
      'image': 'assets/person_4.png',
      'name': 'Arjun',
      'amount': '₹500',
    },
    {
      'image': 'assets/person_5.png',
      'name': 'Krishna',
      'amount': '₹200',
    },
    {
      'image': 'assets/person_6.png',
      'name': 'Karan',
      'amount': '₹100',
    },
    {
      'image': 'assets/person_7.png',
      'name': 'Pawan',
      'amount': '₹100',
    },
    {
      'image': 'assets/person_8.png',
      'name': 'Aditya',
      'amount': '₹50',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/bg_one.png'), fit: BoxFit.cover)
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.05,
                  left: Get.width * 0.05,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Image.asset(
                        'assets/arrow_back.png',
                        width: 25,
                        height: 25,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'WINNER ANNOUNCED',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.05,
                  left: Get.width * 0.05,
                ),
                child: Text(
                  'Giveaway results are here',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.05,
                  left: Get.width * 0.05,
                ),
                child: Text(
                  'Check Your Name In The Winner List',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color(0xFFD3D3D3).withOpacity(0.2),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: winnersList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final winners = winnersList[index];
                    return WinnerItem(winners: winners);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.05,
                  left: Get.width * 0.05,
                ),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'If your Name Is Not on this List Don\'t be sad, You can ',
                      ),
                      TextSpan(
                        text: 're-participate',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.05,
                  left: Get.width * 0.05,
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.congratulation);
                  },
                  child: Container(
                    width: Get.width,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/try_again_bg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Try Again',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.05,
                  left: Get.width * 0.05,
                ),
                child: Text(
                  'You can also try a new Giveaway',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.04,
                  left: Get.width * 0.04,
                ),
                child: InkWell(
                  onTap: () {},
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
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
