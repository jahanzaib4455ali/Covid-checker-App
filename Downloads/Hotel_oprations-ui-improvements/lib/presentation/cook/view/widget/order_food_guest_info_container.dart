import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class OrderFoodGuestInfoContainer extends StatelessWidget {
  const OrderFoodGuestInfoContainer({
    super.key,
    required this.text1,
    required this.text2,
    this.isLast,
  });

  final String text1;
  final String text2;
  final bool? isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text1,
          style: myTextStyle.font_10w400.copyWith(
            fontSize: 13,
            color: MyColors.gray979797,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        TextView(
          text2,
          style: myTextStyle.font_10w400.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: MyColors.dark242424,
          ),
        ),
        if ((isLast ?? false) == false)
          SizedBox(
            height: 10.h,
          ),
        if ((isLast ?? false) == false)
          Container(
            height: 1,
            width: 54.w,
            color: MyColors.grayEFEFEF,
          ),
        SizedBox(
          height: 13.h,
        ),
      ],
    );
  }
}
