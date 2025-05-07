import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.image,
    required this.heading,
    required this.desc,
  });

  final String image;
  final String heading;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Image(
                image: AssetImage(image),
                width: 35,
                height: 35,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Get.width * 0.05,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Rubik',
                      letterSpacing: 0.0,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    desc,
                    style: TextStyle(
                      color: Color(0xFF8D8D8D),
                      fontSize: Get.width * 0.038,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Rubik',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(
          color: Color(0xFFCACACA),
          thickness: 1,
          height: 1,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
