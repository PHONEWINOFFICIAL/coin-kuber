import 'package:flutter/material.dart';

class WinnerItem extends StatelessWidget {
  const WinnerItem({super.key, required this.winners});

  final Map<String, dynamic> winners;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1.0),
        image: DecorationImage(
          image: AssetImage('assets/winners_bg.png'),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color(0xFFD3D3D3).withOpacity(0.2),
                  image: DecorationImage(
                    image: AssetImage(
                      winners['image'],
                    ),
                  ),
                ),
              ),
              Image(
                image: AssetImage('assets/trophy.png'),
                width: 60,
                height: 70,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              winners['name'],
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Rubik',
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '4568932456',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Rubik',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    Color(0xFF006400).withOpacity(0.6),
                    Color(0xFF013220),
                  ],
                  stops: [0.1, 1.0],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: Text(
                  winners['amount'],
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Rubik',
                  ),
                ),
              ),
              Image(
                image: AssetImage('assets/insta.png'),
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
