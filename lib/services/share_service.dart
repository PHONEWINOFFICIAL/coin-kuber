import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShareService {
  static const androidPlatform = MethodChannel('com.example.coin_kuber_new/share');
  static const iosPlatform = MethodChannel('com.example.coin_kuber_new/share');

  Future<bool> shareTextToWhatsApp({
    required BuildContext? context,
    required String? text,
    required String? imageUrl,
    required bool isBusiness,
    required Function(String message) onShareComplete,
  }) async {
    // if (text!.isEmpty || imageUrl!.isEmpty) {
    //   onShareComplete('Invalid content to share');
    //   return false;
    // }

    try {
      final Map<String, dynamic> args = {
        "text": text,
        "packageName": isBusiness
            ? (Platform.isIOS ? "net.whatsapp.WhatsAppBusiness" : "com.whatsapp.w4b")
            : (Platform.isIOS ? "net.whatsapp.WhatsApp" : "com.whatsapp"),
      };

      if (imageUrl != null && imageUrl.trim().isNotEmpty) {
        args["imageUrl"] = imageUrl;
      }

      dynamic result;
      if (Platform.isIOS) {
        result = await iosPlatform.invokeMethod('shareTextToWhatsApp', args);
      } else {
        result = await androidPlatform.invokeMethod('shareTextToWhatsApp', args);
      }

      return handleShareResult(
          result: result,
          context: context,
          text: text,
          imageUrl: imageUrl,
          onShareComplete: onShareComplete);
    } on PlatformException catch (e) {
      debugPrint("Failed to share content: '${e.message}'.");
    }
    return false;
  }

  bool handleShareResult({required BuildContext? context,
    required String? result,
    String? text,
    String? imageUrl,
    required Function(String message) onShareComplete}) {
    if (result == 'success') {
      onShareComplete('Content shared successfully');

      return true;
    } else {
      onShareComplete('Failed to share content');
      return false;
    }
  }
}

final ShareService shareService = ShareService();
