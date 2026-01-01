import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String count;
  final String icon;
  const SummaryCard({super.key, required this.icon, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = (MediaQuery.of(context).size.width - 16.w * 3) / 2;
    return Container(
      width: cardWidth,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: MyColors.grayD0D5DD),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, width: 32.w, height: 32.w, colorFilter: const ColorFilter.mode(MyColors.dark000000, BlendMode.srcIn)),
          SizedBox(height: 10.h),
          TextView(
            title,
            style: myTextStyle.font_14w400.copyWith(
              color: MyColors.gray6D6D6D,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          TextView(
            count,
            style: myTextStyle.font_30w700.copyWith(
              color: MyColors.dark000000,
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
