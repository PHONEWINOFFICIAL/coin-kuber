import 'package:coin_kuber_new/widgets/custom_button.dart';
import 'package:coin_kuber_new/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../widgets/select_money.dart';
import 'logic.dart';
import 'state.dart';

class GetAmountPage extends StatefulWidget {
  const GetAmountPage({super.key});

  @override
  State<GetAmountPage> createState() => _GetAmountPageState();
}

class _GetAmountPageState extends State<GetAmountPage> {
  final GetAmountLogic logic = Get.put(GetAmountLogic());
  final GetAmountState state = Get.find<GetAmountLogic>().state;

  late String amount;
  late String image;

  @override
  void initState() {
    super.initState();
    final arguments = Get.arguments as Map<String, dynamic>;
    amount = arguments['amount'] ?? "Unknown Phone";
    image = arguments['image'] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/bg_one.png'), fit: BoxFit.cover)
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: Get.width * 0.05,
            left: Get.width * 0.05,
          ),
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
              const SizedBox(height: 20),
              SelectMoney(
                isSelectable: false,
                amount: amount,
                image: image,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              NoteItem(
                image: 'assets/kaise_milega.png',
                heading: 'Kaise Milega',
                desc:
                    'Aage Aapse Apka Number Pucha jayega,Shi Number Dalna hai, Usi Number pr Apko Bheja jayega',
              ),
              NoteItem(
                image: 'assets/one.png',
                heading: 'Paisa Kha Milega',
                desc:
                    'App ko apne 5 dosto ko share karke Task complete krna hai.',
              ),
              NoteItem(
                image: 'assets/terms.png',
                heading: 'Terms Conditions',
                desc:
                    'Paise Sabhi Logo Ko Nhi Mil Payenge, Kuch Lucky logo ko Hi Mil Payenge, Aap Nhi jeet pate ho to Dusre Din Phir Se try kr skte ho.',
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.taskExplanation,
                    arguments: {'image': image},
                  );
                },
                label: 'Get $amount',
                showIcon: false,
                isClickable: true,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
