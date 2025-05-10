import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/routes.dart';
import 'logic.dart';
import 'state.dart';

class ParticipatedPage extends StatelessWidget {
  ParticipatedPage({super.key});

  final ParticipatedLogic logic = Get.put(ParticipatedLogic());
  final ParticipatedState state = Get.find<ParticipatedLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_two.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Image(image: AssetImage('assets/participated_bg.png')),
            Positioned(
              top: Get.height * 0.68,
              right: 0,
              left: 0,
              child: Image(image: AssetImage('assets/money.png')),
            ),
            Positioned(
              top: Get.height * 0.4,
              left: 10,
              child: SizedBox(
                width: 29,
                child: Image(
                  image: AssetImage('assets/participated_decoration.png'),
                ),
              ),
            ),
            Positioned(
              top: Get.height * 0.4,
              right: 10,
              child: SizedBox(
                width: 29,
                child: Image(
                  image: AssetImage('assets/participated_decoration.png'),
                ),
              ),
            ),
            Positioned(
              top: Get.height * 0.11,
              right: 0,
              left: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage('assets/stars.png'),
                        width: Get.width * 0.8,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -20),
                      child: Center(
                        child: Image(
                          image: AssetImage('assets/crown.png'),
                          width: 180,
                          height: 180,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Congratulations!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Get.width * 0.08,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            fontSize: Get.width * 0.033,
                            color: Colors.grey,
                          ),
                          children: [
                            TextSpan(
                              text: 'You Have Successfully Participated\nFor',
                            ),
                            TextSpan(
                              text: ' ₹100 ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(text: 'Choose in Starting'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Image.asset(
                              'assets/line_left.png',
                              fit: BoxFit.contain,
                              height: 20,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ' Time ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            flex: 3,
                            child: Image.asset(
                              'assets/line_right.png',
                              fit: BoxFit.contain,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    CountdownTimer(),
                    const SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.05,
                      ),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    const SizedBox(height: 50),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.04,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.selectAmount);
                        },
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
          ],
        ),
      ),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  int _hours = 5;
  int _minutes = 0;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _loadTimer();
  }

  void _loadTimer() async {
    final prefs = await SharedPreferences.getInstance();
    final endTime = prefs.getString('end_time');

    if (endTime != null && endTime.isNotEmpty) {
      DateTime endDateTime = DateTime.parse(endTime);
      final remaining = endDateTime.difference(DateTime.now());

      if (remaining.isNegative) {
        _hours = 0;
        _minutes = 0;
        _seconds = 0;
      } else {
        _hours = remaining.inHours;
        _minutes = remaining.inMinutes % 60;
        _seconds = remaining.inSeconds % 60;
        _startTimer();
      }
    } else {
      final endDateTime = DateTime.now().add(Duration(hours: 5));
      prefs.setString('end_time', endDateTime.toIso8601String());

      _hours = 5;
      _minutes = 0;
      _seconds = 0;
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        if (_minutes > 0) {
          setState(() {
            _minutes--;
            _seconds = 59;
          });
        } else if (_hours > 0) {
          setState(() {
            _hours--;
            _minutes = 59;
            _seconds = 59;
          });
        } else {
          timer.cancel();
          final prefs = await SharedPreferences.getInstance();
          prefs.remove('end_time');
        }
      }

      final prefs = await SharedPreferences.getInstance();
      final newEndTime = DateTime.now()
          .add(Duration(hours: _hours, minutes: _minutes, seconds: _seconds));
      prefs.setString('end_time', newEndTime.toIso8601String());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _buildTimeBox(String label, int currentValue, int nextValue) {
    return Column(
      children: [
        // Top Container
        Container(
          height: 30,
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/timer_bg.png'),
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  currentValue.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Rubik',
                    fontSize: 44,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 3),
        // Bottom Container with clipped text
        Container(
          height: 30,
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/timer_bg.png'),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -33,
                left: 0,
                right: 0,
                child: Text(
                  currentValue.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Rubik',
                    fontSize: 44,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Rubik',
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTimeBox(
          "HOURS",
          _hours,
          (_hours - 1 < 0) ? 0 : _hours - 1,
        ),
        Transform.translate(
          offset: const Offset(0, -12),
          child: Column(
            children: [
              Image(image: AssetImage('assets/dot.png'), width: 5),
              const SizedBox(height: 5),
              Image(image: AssetImage('assets/dot.png'), width: 5),
            ],
          ),
        ),
        _buildTimeBox(
          "MINUTES",
          _minutes,
          (_minutes - 1 < 0) ? 59 : _minutes - 1,
        ),
        Transform.translate(
          offset: const Offset(0, -12),
          child: Column(
            children: [
              Image(image: AssetImage('assets/dot.png'), width: 5),
              const SizedBox(height: 5),
              Image(image: AssetImage('assets/dot.png'), width: 5),
            ],
          ),
        ),
        _buildTimeBox(
          "SECONDS",
          _seconds,
          (_seconds - 1 < 0) ? 59 : _seconds - 1,
        ),
      ],
    );
  }
}


