import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/utils/app_constants/app_context.dart';

class CustomCupertinoLoader {
  static Future<void> showLoaderDialog({BuildContext? context}) async {
    return showDialog(
      context: context ?? GlobalContext.currentContext!,
      barrierDismissible: true,
      builder: (context) => PopScope(
        canPop: false,
        child: Center(
          child: Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: MyColors.primaryDark1D1929,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.all(16).w,
            child: const CupertinoActivityIndicator(
              color: MyColors.whiteFFFFFF,
              radius: 18,
            ),
          ),
        ),
      ),
    );
  }

  static Widget showLoaderWidget(
      {Color bgColor = MyColors.primaryDark1D1929}) {
    return Center(
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          color: MyColors.primaryDark1D1929,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(16).w,
        child: const CupertinoActivityIndicator(
          color: MyColors.whiteFFFFFF,
          radius: 18,
        ),
      ),
    );
  }

  static Future<void> dispose() async {
    Navigator.pop(GlobalContext.currentContext!);
  }
}
