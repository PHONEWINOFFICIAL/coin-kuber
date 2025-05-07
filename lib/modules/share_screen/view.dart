import 'package:coin_kuber_new/services/share_service.dart';
import 'package:coin_kuber_new/widgets/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../routes/routes.dart';
import '../../widgets/custom_button.dart';
import 'logic.dart';
import 'state.dart';

class ShareScreenPage extends StatefulWidget {
  const ShareScreenPage({super.key});

  @override
  State<ShareScreenPage> createState() => _ShareScreenPageState();
}

class _ShareScreenPageState extends State<ShareScreenPage> {
  final ShareScreenLogic logic = Get.put(ShareScreenLogic());

  final ShareScreenState state = Get
      .find<ShareScreenLogic>()
      .state;

  final ShareService shareService = ShareService();

  Set<int> completedIndexes = {};

  bool isEveryTrue = false;
  List<bool> shareStatuses = List.generate(6, (_) => false);

  @override
  void initState() {
    super.initState();
    loadShareStatus();
  }

  Future<void> loadShareStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList('share_statuses');
    if (stored != null && stored.length == 6) {
      setState(() {
        shareStatuses = stored.map((e) => e == 'true').toList();
      });
    }
  }

  Future<void> saveShareStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('share_statuses', shareStatuses.map((e) => e.toString()).toList());
  }

  void setWhatsAppStatus(int index, bool status) async {
    setState(() {
      for (int i = 0; i < shareStatuses.length; i++) {
        shareStatuses[i] = (i == index) ? status : false;
      }
    });
    await saveShareStatus();
  }

  Future<void> shareToWhatsApp({
    required bool isBusiness,
    required int index,
    required dynamic item,
  }) async {
    final shareText = item.shareTxt ?? '';

    bool status = await shareService.shareTextToWhatsApp(
      context: context,
      text: shareText,
      imageUrl: '',
      isBusiness: isBusiness,
      onShareComplete: (String message) {},
    );

    if (!status) {
      InteractiveToast.slide(
        title: Text(
          'Failed to share content. Try Again!',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        toastStyle: ToastStyle(
          titleLeadingGap: 10,
          backgroundColor: Colors.red,
          progressBarColor: AppColors.whiteColor,
        ),
        toastSetting: const SlidingToastSetting(
          animationDuration: Duration(seconds: 1),
          displayDuration: Duration(milliseconds: 100),
          toastStartPosition: ToastPosition.bottom,
          toastAlignment: Alignment.bottomCenter,
          maxWidth: double.infinity,
        ),
      );
    }

    setWhatsAppStatus(index, status);
    completedIndexes.add(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        padding: EdgeInsets.only(
          top: 40,
          right: Get.width * 0.05,
          left: Get.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              const SizedBox(height: 10),
              SizedBox(
                height: Get.height * 0.78,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.82
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return CustomBox(
                      index: index,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              color: Colors.black87,
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 15,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Image.asset(
                                      'assets/whatsapp.png',
                                      width: 30,
                                    ),
                                    title: Text(
                                      "WhatsApp",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontFamily:
                                        AppAssets.radioCanada,
                                      ),
                                    ),
                                    onTap: () async {
                                      Get.back();
                                      await shareToWhatsApp(
                                        isBusiness: false,
                                        index: index,
                                        item: 'This is a test message',
                                      );
                                    },
                                  ),
                                  Divider(
                                    color: AppColors.greyColor,
                                  ),
                                  ListTile(
                                    leading: Image.asset(
                                      'assets/whatsapp.png',
                                      width: 30,
                                    ),
                                    title: Text(
                                      "WhatsApp Business",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontFamily:
                                        AppAssets.radioCanada,
                                      ),
                                    ),
                                    onTap: () async {
                                      Get.back();
                                      await shareToWhatsApp(
                                        isBusiness: true,
                                        index: index,
                                        item: 'This is a test message',
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      isGradient: true,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.taskList);
                },
                label: 'Continue',
                showIcon: false,
                isClickable: true,
                textColor: Colors.black,
                bgColor: Color(0xFFD0D0D0),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
