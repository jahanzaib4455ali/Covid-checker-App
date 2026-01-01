import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_elevated_button.dart';
import 'package:kunggy_operational_app/common/widget/my_text_field.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';

class EnterForgotPasswordScreen extends StatelessWidget {
  const EnterForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 56.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 39.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(MyIcons.arrowRight),
                ),
                TextView(
                  "Forgot Password ",
                  style: myTextStyle.font_20wMedium,
                ),
                const SizedBox()
              ],
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  "Enter New Password ",
                  style: myTextStyle.font_14w500.copyWith(fontSize: 16.h),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextFormField(
                  containerColor: MyColors.primaryDark1D1929.withOpacity(0.06),
                  hintText: "**************",
                  prefixIcon: SvgPicture.asset(
                    MyIcons.lock,
                    fit: BoxFit.none,
                  ),
                  trailingWidget: SvgPicture.asset(
                    MyIcons.eyeOpen,
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  "Confirm Password  ",
                  style: myTextStyle.font_14w500.copyWith(fontSize: 16.h),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextFormField(
                  containerColor: MyColors.primaryDark1D1929.withOpacity(0.06),
                  hintText: "**************",
                  prefixIcon: SvgPicture.asset(
                    MyIcons.lock,
                    fit: BoxFit.none,
                  ),
                  trailingWidget: SvgPicture.asset(
                    MyIcons.eyeClose,
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          MyElevatedButton(
            text: "Reset",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.loginScreen, (route) => false);
            },
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            height: 56,
            buttonBGColor: MyColors.primaryDark1D1929,
            textStyle: myTextStyle.font_20wMedium.copyWith(
              fontSize: 20.h,
              color: MyColors.whiteFFFFFF,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
