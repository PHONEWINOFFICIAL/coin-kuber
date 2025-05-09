import 'dart:async';

import 'package:coin_kuber_new/services/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/routes.dart';
import 'logic.dart';
import 'state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashLogic logic = Get.put(SplashLogic());
  final SplashState state = Get.find<SplashLogic>().state;

  @override
  void initState() {
    super.initState();
    _checkParticipationAndNavigate();
  }

  void _checkParticipationAndNavigate() async {
    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();
    final isParticipated = prefs.getString('is_participated');

    if (isParticipated == 'yes') {
      final endTimeString = prefs.getString('end_time');

      if (endTimeString != null && endTimeString.isNotEmpty) {
        final endTime = DateTime.parse(endTimeString);

        if (DateTime.now().isAfter(endTime)) {
          Get.offNamed(AppRoutes.winners);
        } else {
          Get.offNamed(AppRoutes.participated);
        }
      } else {
        Get.offNamed(AppRoutes.participated);
      }
    } else {
      Get.offNamed(AppRoutes.selectAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash.png'),
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}
