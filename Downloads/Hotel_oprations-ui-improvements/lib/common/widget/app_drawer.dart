import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';

import '../../l10n/app_localizations.dart';

// Create a simple constants class for images
class MyImages {
  static const String user = 'assets/images/user.png';
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 1.sw,
        color: MyColors.whiteFFFFFF,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 19.w, right: 19.w, top: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.profileScreen,
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    MyImages.user,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 18.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  "Stackei John",
                                  style: myTextStyle.font_16ww500
                                      .copyWith(fontSize: 18.h),
                                ),
                                TextView(
                                  "18 oct 2023 - 08:21:27",
                                  style: myTextStyle.font_12w400.copyWith(
                                    color: MyColors.grayB8B8B8,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 35.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: MyColors.dark000000.withOpacity(0.2))),
                          child: const Icon(Icons.clear),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 52.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.settingScreen);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 17.w, right: 32.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  MyIcons.setting,
                                ),
                                SizedBox(
                                  width: 21.w,
                                ),
                                TextView(
                                  AppLocalizations.of(context)?.setting ??
                                  "Setting",
                                  style: myTextStyle.font_16ww400,
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              MyIcons.fatArrowRight,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 1,
                        color: MyColors.grayD0D5DD,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.employeeRules);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 17.w, right: 32.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  MyIcons.alertTriangle,
                                ),
                                SizedBox(
                                  width: 21.w,
                                ),
                                TextView(
                                    AppLocalizations.of(context)?.employeeRules ??
                                  "Employee Rules & Regulations",
                                  style:  myTextStyle.font_16ww400,
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              MyIcons.fatArrowRight,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 1,
                        color: MyColors.grayD0D5DD,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.languageScreen);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 17.w, right: 32.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  MyIcons.language2,
                                ),
                                SizedBox(
                                  width: 21.w,
                                ),
                                TextView(
                                  AppLocalizations.of(context)?.language ??
                                  "Language",
                                  style: myTextStyle.font_16ww400,
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              MyIcons.fatArrowRight,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 1,
                        color: MyColors.grayD0D5DD,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.aboutScreen);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 17.w, right: 32.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  MyIcons.questionCircle,
                                ),
                                SizedBox(
                                  width: 21.w,
                                ),
                                TextView(
                                  AppLocalizations.of(context)?.about ??
                                  "About",
                                  style: myTextStyle.font_16ww400,
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              MyIcons.fatArrowRight,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 1,
                        color: MyColors.grayD0D5DD,
                      )
                    ],
                  ),
                ),

              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 32.h),
              child: InkWell(
                onTap: () {
                  // Navigate back to role selection screen
                  Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
                    Routes.roleSelectionScreen,
                    (route) => false,
                  );
                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 17.w, right: 32.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            width: 25.w,
                            height: 25.h,
                            MyIcons.logout,
                            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          TextView(
                            AppLocalizations.of(context)?.logout ??
                            "Logout",
                            style: myTextStyle.font_25wRegular.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 24.h,
                              color: MyColors.redEA445C,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
