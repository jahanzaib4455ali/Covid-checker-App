import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/common/models/dashboard_models.dart';

class StatCard extends StatelessWidget {
  final StatMetric metric;
  const StatCard({super.key, required this.metric});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColors.grayD0D5DD),
        color: MyColors.whiteFFFFFF,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            metric.title,
            style: myTextStyle.font_14w400
                .copyWith(fontSize: 16.h, color: MyColors.gray71717A),
          ),
          SizedBox(height: 8.h),
          TextView(
            metric.value,
            style: myTextStyle.font_32w700.copyWith(
              fontSize: 33.h,
              color: MyColors.dark434343,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (metric.subtitle != null) ...[
            SizedBox(height: 4.h),
            TextView(
              metric.subtitle!,
              style: myTextStyle.font_10w400
                  .copyWith(fontSize: 12.h, color: MyColors.gray9F9F9F),
            )
          ],
        ],
      ),
    );
  }
}
