import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_button.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({super.key, required this.index, required this.onTap, this.isGradient, this.label, this.image});

  final int index;
  final VoidCallback onTap;
  final bool? isGradient;
  final String? label;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 15),
      decoration: BoxDecoration(
        color: isGradient == true ? null : Colors.white,
        gradient: isGradient == true
            ? LinearGradient(
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF),
            Color(0xFF95BC2D).withOpacity(0.3),
            Color(0xFF95BC2D).withOpacity(0.4),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
            : null,
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image(image: AssetImage(image ?? 'assets/group.png'), width: 40, height: 40),
          const SizedBox(height: 10),
          Text(
            label ?? 'Friend ${index + 1}',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontSize: Get.width * 0.045,
              fontWeight: FontWeight.w700,
              fontFamily: 'Rubik',
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Click on button and Wait 30 Second',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8D8D8D),
              fontSize: Get.width * 0.035,
              fontWeight: FontWeight.w600,
              fontFamily: 'Rubik',
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
            onTap: onTap,
            label: 'Shared',
            height: 40,
            showIcon: true,
            isClickable: true,
            textColor: Colors.white,
            icon: 'assets/smile.png',
            textSize: Get.width * 0.04,
            radius: 7,
            isGradient: true,
            spacing: 0,
            iconSize: 40,
          ),
        ],
      ),
    );
  }
}
