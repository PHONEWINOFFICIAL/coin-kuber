import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.showIcon,
    this.icon,
    required this.label,
    required this.isClickable,
    this.height,
    this.textColor,
    this.textSize,
    this.bgColor,
    this.isGradient, this.radius, this.spacing, this.iconSize,
  });

  final VoidCallback onTap;
  final bool showIcon;
  final String? icon;
  final String label;
  final bool isClickable;
  final double? height;
  final Color? textColor;
  final double? textSize;
  final Color? bgColor;
  final bool? isGradient;
  final double? radius;
  final double? spacing;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isClickable ? onTap : null,
      child: Container(
        width: Get.width,
        height: height ?? 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          color: isGradient == true ? null : (bgColor ?? Color(0xFF9AD942)),
          gradient: isGradient == true
              ? LinearGradient(
            colors: [
              Color(0xFF5E9D31),
              Color(0xFF116F35),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: showIcon,
              child: Image(
                image: AssetImage(icon ?? ''),
                width: iconSize ?? 25,
                height: iconSize ?? 25,
              ),
            ),
            Visibility(visible: showIcon, child: SizedBox(width: spacing ?? 10)),
            Text(
              label,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: textSize ?? Get.width * 0.045,
                fontWeight: FontWeight.w600,
                fontFamily: 'Rubik',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
