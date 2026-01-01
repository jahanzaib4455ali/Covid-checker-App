import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class SecurityHomeButton extends StatelessWidget {
  const SecurityHomeButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:
            EdgeInsets.only(top: 13.h, left: 16.w, right: 17.w, bottom: 16.h),
        // height: 140.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: MyColors.grayD0D5DD,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text,
              style: myTextStyle.font_14w500,
            ),
            InkWell(
              onTap: () {
                onTap.call();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextView(
                    "See List",
                    style: myTextStyle.font_14w500.copyWith(
                      color: MyColors.primaryDark1D1929,
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  SvgPicture.asset(
                    MyIcons.arrowLeft,
                    colorFilter: const ColorFilter.mode(
                      MyColors.primaryDark1D1929,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
