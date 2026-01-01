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
import '../../../../l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  bool _isAcceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),

              /// App Title (Updated to match Image)
              Center(
                child: Column(
                  children: [
                    TextView(
                      "kunguy",
                      style: myTextStyle.font_10w400.copyWith(
                        fontSize: 48.sp,
                        fontWeight: FontWeight.w800,
                        color: MyColors.primaryDark1D1929,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    TextView(
                      "PMS Operations",
                      style: myTextStyle.font_10w400.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.primaryDark1D1929,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60.h),

              /// Login Note
              Center(
                child: TextView(
                  AppLocalizations.of(context)?.loginnote ??
                      "Welcome! Please enter your login details",
                  style: myTextStyle.font_10w400.copyWith(
                    fontSize: 16.sp,
                    color: MyColors.gray6E7C87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 40.h),

              /// Username or Email
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      AppLocalizations.of(context)?.username ?? "Username or Email Address",
                      style: myTextStyle.font_20wMedium.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      containerColor: MyColors.grayF7F7F8.withOpacity(0.50),
                      hintText: "Enter your Username or Email Address",
                      trailingWidget: SvgPicture.asset(
                        MyIcons.person,
                        width: 20.w,
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              /// Password
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      AppLocalizations.of(context)?.enterPassword ??
                          "Enter Password",
                      style: myTextStyle.font_20wMedium.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      containerColor: MyColors.grayF7F7F8.withOpacity(0.50),
                      hintText: "Enter Password",
                      obscureText: !_isPasswordVisible,
                      trailingWidget: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: SvgPicture.asset(
                          _isPasswordVisible
                              ? MyIcons.eyeOpen
                              : MyIcons.eyeClose,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              /// Terms & Conditions Checkbox
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Row(
                  children: [
                    Checkbox(
                      value: _isAcceptedTerms,
                      activeColor: MyColors.primaryDark1D1929,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      onChanged: (value) {
                        setState(() {
                          _isAcceptedTerms = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          TextView(
                            "I accept, ",
                            style: myTextStyle.font_10w400.copyWith(
                              fontSize: 13.sp,
                              color: MyColors.gray6E7C87,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: TextView(
                              "Terms & Conditions",
                              style: myTextStyle.font_10w400.copyWith(
                                fontSize: 13.sp,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          TextView(
                            " & ",
                            style: myTextStyle.font_10w400.copyWith(
                              fontSize: 13.sp,
                              color: MyColors.gray6E7C87,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: TextView(
                              "Privacy Policy",
                              style: myTextStyle.font_10w400.copyWith(
                                fontSize: 13.sp,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60.h),

              /// Login Button (Functionality added)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: MyElevatedButton(
                  onPressed: () {
                    // Click hote hi navigation
                    Navigator.pushNamed(
                      context,
                      Routes.twoFactorAuthScreen,
                    );
                  },
                  text: AppLocalizations.of(context)?.loginButton ?? "Login",
                  width: double.infinity,
                  height: 75.h,
                  buttonBGColor: MyColors.primaryDark1D1929,
                  textStyle: myTextStyle.font_20wMedium.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: MyColors.whiteFFFFFF,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),




              SizedBox(height: 40.h),


            ],
          ),
        ),
      ),
    );
  }
}