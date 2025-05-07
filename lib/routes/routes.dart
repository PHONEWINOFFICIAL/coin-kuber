
import 'package:get/get.dart';

import '../modules/address/view.dart';
import '../modules/congratulations/view.dart';
import '../modules/get_amount/view.dart';
import '../modules/participated/view.dart';
import '../modules/select_amount/view.dart';
import '../modules/share_screen/view.dart';
import '../modules/splash/view.dart';
import '../modules/task_explanation/view.dart';
import '../modules/tasks/view.dart';
import '../modules/terms_conditions/view.dart';
import '../modules/winners/view.dart';

class AppRoutes {
  static const splash = '/splash';
  static const selectAmount = '/amount-list';
  static const getAmount = '/get-amount';
  static const taskExplanation = '/task-explanation';
  static const shareWhatsapp = '/share-whatsapp';
  static const taskList = '/task-list';
  static const address = '/shipping-address';
  static const congratulation = '/congratulation';
  static const termsConditions = '/terms-conditions';
  static const winners = '/winners';
  static const participated = '/participated';

  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: selectAmount,
      page: () => SelectAmountPage(),
    ),
    GetPage(
      name: getAmount,
      page: () => GetAmountPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: taskExplanation,
      page: () => TaskExplanationPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: termsConditions,
      page: () => TermsConditionsPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: shareWhatsapp,
      page: () => ShareScreenPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: taskList,
      page: () => TasksPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: address,
      page: () => AddressPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: congratulation,
      page: () => CongratulationsPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: winners,
      page: () => WinnersPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: participated,
      page: () => ParticipatedPage(),
      transition: Transition.noTransition,
    ),
  ];
}
