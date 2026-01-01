import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

import '../../../../l10n/app_localizations.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: true,
      isProfile: true,
      isScrollable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 167.h,
                width: 1.sw,
              ),
              Positioned(
                top: 0,
                child: Container(
                  height: 114.h,
                  width: 1.sw,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffC9F6D3),
                        Color(0xffA4B2FF),
                      ],
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: 114.w,
                    height: 114.h,
                    decoration: const BoxDecoration(
                      color: MyColors.whiteFFFFFF,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 106.w,
                      height: 106.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            MyImages.user2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 32.w,
                        height: 32.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyColors.whiteFFFFFF,
                        ),
                        child: SvgPicture.asset(
                          MyIcons.camera,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 100,
                bottom: 0,
                right: 10,
                child: InkWell(
                  splashColor: MyColors.transparent,
                  highlightColor: MyColors.transparent,
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    width: 27.w,
                    height: 27.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: MyColors.grayD0D5DD,
                      ),
                    ),
                    child: SvgPicture.asset(MyIcons.editPen),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: TextView(
              "Rajeev  Mehta",
              style: myTextStyle.font_16ww500.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 23.h,
                color: MyColors.dark07090D,
              ),
            ),
          ),
          SizedBox(
            height: 38.h,
          ),
           Padding(
              padding: EdgeInsets.only(left: 80.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(MyIcons.call),
                      SizedBox(
                        width: 8.w,
                      ),
                      TextView(
                        "+91 - 2314451341",
                        style: myTextStyle.font_16ww400.copyWith(
                          color: MyColors.gray6E7C87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(MyIcons.message),
                      SizedBox(
                        width: 8.w,
                      ),
                      TextView(
                        "rajeev@gmail.com ",
                        style: myTextStyle.font_16ww400.copyWith(
                          color: MyColors.gray6E7C87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          SizedBox(
            height: 30.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Row(
                children: [
                  SvgPicture.asset(MyIcons.location),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                    style: myTextStyle.font_16ww400.copyWith(
                      color: MyColors.gray6E7C87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                ],
              ),
            ),
          ),
          SizedBox(
            height: 31.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  AppLocalizations.of(context)?.basicInformation ?? "Basic Information",
                  style: myTextStyle.font_16ww500.copyWith(
                    color: MyColors.dark07090D,
                    fontSize: 18.h,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Wrap(
                  spacing: 50.w,
                  runSpacing: 24.h,
                  children: [
                    BasicInfoWidget(
                      text1: AppLocalizations.of(context)?.employeeId ?? "Employee ID",
                      text2: "3123456",
                    ),
                    BasicInfoWidget(
                      text1: AppLocalizations.of(context)?.workLocation ?? "Work Location",
                      text2: AppLocalizations.of(context)?.mainBranch ?? "Main Branch",
                    ),
                    BasicInfoWidget(
                      text1: AppLocalizations.of(context)?.workSchedule ?? "Work Schedule",
                      text2: "12 hr",
                    ),
                    BasicInfoWidget(
                      text1: AppLocalizations.of(context)?.joiningDate ?? "Joining Date",
                      text2: "12-july-2002",
                    ),
                    BasicInfoWidget(
                      text1: AppLocalizations.of(context)?.employeeStatus ?? "Employee Status",
                      text2:  "Full Time",
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  AppLocalizations.of(context)?.occupationalInformation ?? "Occupational Information",
                  style: myTextStyle.font_16ww500.copyWith(
                    color: MyColors.dark07090D,
                    fontSize: 18.h,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Wrap(
                  spacing: 40.w,
                  runSpacing: 24.h,
                  children: [
                    BasicInfoWidget(
                      text1: AppLocalizations.of(context)?.qualification ?? "Qualification",
                      text2:  "BW Engineering",
                    ),
                    BasicInfoWidget(
                      text1: AppLocalizations.of(context)?.designation ?? "Designation",
                      text2: "General Manager",
                    ),
                    BasicInfoWidget(
                      text1: AppLocalizations.of(context)?.departments ?? "Departments ",
                      text2:  "Admin",
                    ),
                    BasicInfoWidget(
                      text1: AppLocalizations.of(context)?.reportingTo ?? "Reporting To",
                      text2:  "CEO",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BasicInfoWidget extends StatelessWidget {
  const BasicInfoWidget({
    super.key,
    required this.text1,
    required this.text2,
  });

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text1,
          style: myTextStyle.font_12w500
              .copyWith(color: MyColors.gray6E7C87, fontSize: 16.h),
        ),
        SizedBox(
          height: 5.h,
        ),
        TextView(
          text2,
          style: myTextStyle.font_12w500
              .copyWith(color: MyColors.dark07090D, fontSize: 15.h),
        ),
      ],
    );
  }
}
