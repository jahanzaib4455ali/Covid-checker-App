import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class LabeledProgressBar extends StatelessWidget {
  final String label;
  final double value; // 0..1
  const LabeledProgressBar({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextView(
                label,
                style: myTextStyle.font_10w400
                    .copyWith(fontSize: 12.h, color: MyColors.primaryDark1D1929),
              ),
            ),
            TextView((value * 10).toStringAsFixed(1),
                style: myTextStyle.font_10w400
                    .copyWith(fontSize: 12.h, color: MyColors.primaryDark1D1929)),
          ],
        ),
        SizedBox(height: 6.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            minHeight: 6.h,
            value: value,
            backgroundColor: MyColors.grayD0D5DD,
            color: MyColors.primaryDark1D1929,
          ),
        ),
      ],
    );
  }
}
