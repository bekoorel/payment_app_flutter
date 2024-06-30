import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:payment_app_flutter/core/style/style.dart';

class CommunicationsCheck {
  static Future<bool> checkIntrnet(context) async {
    if (await InternetConnection().hasInternetAccess) {
      return true;
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text(
              textAlign: TextAlign.center, 'There is no internet connection'),
          icon: Icon(
            Icons.error,
            color: StyleApp.red,
          ),
        ),
      );
      return false;
    }
  }
}
