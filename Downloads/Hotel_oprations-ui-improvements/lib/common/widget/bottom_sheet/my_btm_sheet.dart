import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/utils/app_constants/app_context.dart';

class MyBottomSheet {
  static Future openBottomSheet(
    BuildContext context, {
    required Widget child,
    double? minHieght,
  }) async =>
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(19),
          ),
        ),
        builder: (context) => CustomKeyboardAlignmentWidget(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 1.sw,
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Center(
                  child: Container(
                    height: 3.h,
                    width: 62.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: MyColors.whiteFFFFFF,
                    ),
                  ),
                ),
              ),
              SizedBox(height: minHieght, child: child),
            ],
          ),
        ),
      );

  static closeBottomSheet() {
    Navigator.pop(GlobalContext.currentContext!);
  }
}

class CustomKeyboardAlignmentWidget extends StatelessWidget {
  final Widget child;
  const CustomKeyboardAlignmentWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(padding: mediaQueryData.viewInsets, child: child);
  }
}
