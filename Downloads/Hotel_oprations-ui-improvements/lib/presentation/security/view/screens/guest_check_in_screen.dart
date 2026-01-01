import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';


import '../../../../l10n/app_localizations.dart';

class GuestCheckInScreen extends StatelessWidget {
  const GuestCheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: false,
      isProfile: false,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 23.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      MyIcons.arrowRight,
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  TextView(
                    AppLocalizations.of(context)?.guestCheckIn ?? "Guest Check-In",
                    style: myTextStyle.font_20wMedium.copyWith(
                      fontSize: 20.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, i) {
                    return const GuestCheckInTile();
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class GuestCheckInTile extends StatelessWidget {
  const GuestCheckInTile({super.key, this.isOutgoing});

  final bool? isOutgoing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      //alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 14.w,
        right: 13.w,
        bottom: 10.h,
      ),
      height: 235 .h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: MyColors.grayD0D5DD),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            AppLocalizations.of(context)?.bookingName ?? "Booking Name",
                            style: myTextStyle.font_14w400.copyWith(
                              color: MyColors.gray979797,
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          TextView(
                            "Rahul Kumar",
                            style: myTextStyle.font_14w500.copyWith(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.w,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              AppLocalizations.of(context)?.noOfGuests ?? "No. of Guests",
                              style: myTextStyle.font_14w400.copyWith(
                                color: MyColors.gray979797,
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Flexible(
                              child: TextView(
                                "04",
                                style: myTextStyle.font_14w500.copyWith(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40.w,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            AppLocalizations.of(context)?.checkInDate ?? "Check-in Date",
                            style: myTextStyle.font_14w400.copyWith(
                              color: MyColors.gray979797,
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          TextView(
                            AppLocalizations.of(context)?.today ?? "Today",
                            style: myTextStyle.font_14w500.copyWith(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            AppLocalizations.of(context)?.nationality ?? "Nationality",
                            style: myTextStyle.font_14w400.copyWith(
                              color: MyColors.gray979797,
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          TextView(
                            AppLocalizations.of(context)?.indian ?? "Indian",
                            style: myTextStyle.font_14w500.copyWith(),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.pushNamed(context, Routes.incomingVehicleScreen);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 23.w),
                              height: 33.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: MyColors.primaryDark1D1929,
                              ),
                              child: TextView(
                                isOutgoing ?? false 
                                    ? AppLocalizations.of(context)?.out ?? "OUT"
                                    : AppLocalizations.of(context)?.inButton ?? "IN",
                                style: myTextStyle.font_14w500.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.whiteFFFFFF,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
