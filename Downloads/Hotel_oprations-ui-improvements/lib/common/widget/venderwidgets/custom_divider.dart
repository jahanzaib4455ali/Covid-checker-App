import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/my_colors.dart';


class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeLeft: true,
      removeRight: true,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 2.h,
        color: MyColors.grayF2F2F2,
        margin: EdgeInsets.symmetric(vertical: 8.h),
      ),
    );
  }
}
