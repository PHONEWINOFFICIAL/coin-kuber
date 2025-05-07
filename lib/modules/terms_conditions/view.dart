import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class TermsConditionsPage extends StatelessWidget {
  TermsConditionsPage({Key? key}) : super(key: key);

  final TermsConditionsLogic logic = Get.put(TermsConditionsLogic());
  final TermsConditionsState state = Get.find<TermsConditionsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
