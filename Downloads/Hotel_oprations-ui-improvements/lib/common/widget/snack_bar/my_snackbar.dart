import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_constants/app_context.dart';

class MySnackbar {
  static Future showSnackbar(
    String msg, {
    int durationMS = 1500,
    Color bgColor = Colors.black,
    Color msgColor = Colors.white,
    TextStyle? msgStyle,
  }) async {
    ScaffoldMessenger.of(GlobalContext.currentContext!).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: durationMS),
        content: Text(msg, style: msgStyle ?? myTextStyle.font_16ww400
            // TextStyle(
            //   color: msgColor,
            // ),
            ),
        backgroundColor: bgColor,
      ),
    );
  }
}
