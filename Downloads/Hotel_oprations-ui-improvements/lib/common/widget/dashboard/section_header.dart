import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? trailing;
  const SectionHeader({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: TextView(
              title,
              style: myTextStyle.font_16ww500.copyWith(
                fontSize: 16.h,
                color: MyColors.primaryDark1D1929,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (trailing != null)
            TextView(
              trailing!,
              style: myTextStyle.font_12w400
                  .copyWith(fontSize: 12.h, color: MyColors.gray71717A),
            ),
        ],
      ),
    );
  }
}
