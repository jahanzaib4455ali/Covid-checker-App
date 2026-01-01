import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_elevated_button.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordOTPScreen extends StatelessWidget {
  const ForgotPasswordOTPScreen({super.key});

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
            height: 50.h,
          ),
          TextView(
            padding: EdgeInsets.symmetric(horizontal: 1.sw / 4),
            "Enter Verification code you have received on your email",
            textAlign: TextAlign.center,
            style: myTextStyle.font_14w400.copyWith(color: MyColors.gray737373),
          ),
          SizedBox(
            height: 60.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 47.w),
            child: PinCodeTextField(
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                activeColor: MyColors.primaryDark1D1929,
                selectedColor: MyColors.primaryDark1D1929,
                inactiveColor: MyColors.primaryDark1D1929,
                disabledColor: MyColors.primaryDark1D1929,
                activeFillColor: MyColors.cyanF2FDFC,
                selectedFillColor: MyColors.cyanF2FDFC,
                inactiveFillColor:
                    MyColors.primaryDark1D1929.withOpacity(0.02),
                fieldHeight: 50.h,
                fieldWidth: 50.w,
                borderWidth: 1,
                activeBorderWidth: 1,
                inactiveBorderWidth: 1,
                disabledBorderWidth: 1,
                selectedBorderWidth: 1,
                borderRadius: BorderRadius.circular(8),
              ),
              enableActiveFill: true,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              animationCurve: Curves.fastEaseInToSlowEaseOut,
              textStyle: myTextStyle.font_20wMedium,
              appContext: context,
              onCompleted: (value) async {},
              length: 4,
              blinkDuration: const Duration(milliseconds: 100),
              animationDuration: Duration.zero,
            ),
          ),
          const Spacer(),
          MyElevatedButton(
            text: "Verify",
            onPressed: () {
              Navigator.pushNamed(context, Routes.enterForgotPasswordScreen);
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
