import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kunggy_operational_app/common/models/dashboard_models.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';

class NoticeBanner extends StatelessWidget {
  final NoticeModel notice;
  final VoidCallback? onAction;
  const NoticeBanner({super.key, required this.notice, this.onAction});

  Color _borderColor() {
    switch (notice.type) {
      case NoticeType.warning:
        return MyColors.yellowFFDB57;
      case NoticeType.success:
        return MyColors.green39a957;
      case NoticeType.info:
      default:
        return MyColors.primaryDark1D1929;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.grayD0D5DD),
        boxShadow: [
          BoxShadow(
            color: MyColors.dark000000.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(MyIcons.alertTriangle, width: 18.w, height: 18.h,
              colorFilter: ColorFilter.mode(_borderColor(), BlendMode.srcIn)),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  notice.title,
                  style: myTextStyle.font_16ww500.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.h,
                    color: MyColors.primaryDark1D1929,
                  ),
                ),
                SizedBox(height: 6.h),
                TextView(
                  notice.description,
                  style: myTextStyle.font_10w400
                      .copyWith(fontSize: 12.h, color: MyColors.primaryDark1D1929),
                ),
                if (notice.actionText != null) ...[
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: onAction ?? () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: MyColors.primaryDark1D1929, width: 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: TextView(
                        notice.actionText!,
                        style: myTextStyle.font_16ww500.copyWith(
                          color: MyColors.primaryDark1D1929,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
