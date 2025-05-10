import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectMoney extends StatelessWidget {
  const SelectMoney({
    super.key,
    required this.isSelectable,
    required this.image,
    required this.amount,
    required this.onTap, this.bgColor, this.borderColor,
  });

  final bool isSelectable;
  final String image;
  final String amount;
  final VoidCallback onTap;
  final Color? bgColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 20, right: 20, left: 20),
      margin: EdgeInsets.only(bottom: 20),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor ?? Colors.green, width: 1.0),
        color: bgColor ?? Color(0xFFA8EF54).withOpacity(0.1),
      ),
      child: Column(
        children: [
          Visibility(
            visible: isSelectable,
            child: Text(
              'Amount $amount',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: Get.width * 0.042,
                fontWeight: FontWeight.w600,
                fontFamily: 'Rubik',
              ),
            ),
          ),
          Visibility(visible: isSelectable, child: SizedBox(height: 10)),
          Image(image: AssetImage(image)),
          Visibility(visible: isSelectable, child: SizedBox(height: 10)),
          Visibility(
            visible: isSelectable,
            child: InkWell(
              onTap: onTap,
              child: Container(
                width: Get.width,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF9AD942),
                ),
                child: Center(
                  child: Text(
                    'Get $amount',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Get.width * 0.042,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Rubik',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
