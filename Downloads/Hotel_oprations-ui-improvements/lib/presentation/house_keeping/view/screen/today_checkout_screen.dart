import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/my_text_field.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';


import '../../../../l10n/app_localizations.dart';

class TodayCheckoutScreen extends StatelessWidget {
  const TodayCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return GeneralScaffold(
      isBackButton: false,
      isProfile: false,
      child: Expanded(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(MyIcons.rightArrow2),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextView(
                      AppLocalizations.of(context)?.todayCheckouts ??
                          "Today Checkouts",
                      style: myTextStyle.font_20wMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            CustomTextFormField(
              radius: BorderRadius.circular(7),
              prefixWidth: 40.w,
              textFieldColor: MyColors.grayF7F7F8,
              isFilled: true,
              borderColor: MyColors.grayD0D5DD,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              hintText: AppLocalizations.of(context)?.search ?? "Search",
              prefixIcon: SvgPicture.asset(
                MyIcons.search,
                fit: BoxFit.none,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, i) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w , vertical: 8.h),
                    margin: EdgeInsets.only(
                      left: 12.w,
                      right: 12.w,
                      bottom: 8.h,
                    ),
                    // height: 79.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: MyColors.grayD0D5DD,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: AppLocalizations.of(context)?.roomNoLabel ?? "Room No: ",
                                  style: myTextStyle.font_14w400.copyWith(
                                    color: MyColors.gray979797,
                                    fontSize: 18,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "A-101",
                                      style: myTextStyle.font_14w500,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              RichText(
                                text: TextSpan(
                                  text: AppLocalizations.of(context)?.roomStatusLabel ?? "Room Status: ",
                                  style: myTextStyle.font_14w400.copyWith(
                                    color: MyColors.gray979797,
                                    fontSize: 18,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Avail For Cleaning",
                                      style: myTextStyle.font_14w500,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 13.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: AppLocalizations.of(context)?.checkoutStatusLabel ?? "Checkout Status: ",
                                  style: myTextStyle.font_14w400.copyWith(
                                    color: MyColors.gray979797,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Pending",
                                      style: myTextStyle.font_14w500,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              RichText(
                                text: TextSpan(
                                  text: AppLocalizations.of(context)?.checkoutTimeLabel ?? "Checkout Time: ",
                                  style: myTextStyle.font_14w400.copyWith(
                                    color: MyColors.gray979797,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "11:30AM",
                                      style: myTextStyle.font_14w500,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
