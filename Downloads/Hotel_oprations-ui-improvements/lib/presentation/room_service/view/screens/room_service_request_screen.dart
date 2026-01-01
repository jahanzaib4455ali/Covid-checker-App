import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/presentation/house_keeping/view/screen/task_screen.dart';
import 'package:kunggy_operational_app/presentation/room_service/view/widgets/request_service_widget.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';

import '../../../../l10n/app_localizations.dart';


class RoomServiceRequestScreen extends StatefulWidget {
  const RoomServiceRequestScreen({super.key});

  @override
  State<RoomServiceRequestScreen> createState() =>
      _RoomServiceRequestScreenState();
}

class _RoomServiceRequestScreenState extends State<RoomServiceRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: false,
      isProfile: false,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BreakWidget(),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        top: 12.h,
                        bottom: 4.h,
                      ),
                      // height: 100.h,
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
                            AppLocalizations.of(context)?.itemUsedinMiniBar ??
                            "Item Used in Mini Bar",
                            style: myTextStyle.font_14w500,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.roomServiceMinibarScreen);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextView(
                                  AppLocalizations.of(context)?.seeNow ??
                                  "See Now",
                                  style: myTextStyle.font_14w500.copyWith(
                                    color: MyColors.primaryDark1D1929,
                                    fontSize: 13.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                SvgPicture.asset(
                                  MyIcons.arrowLeft,
                                  colorFilter: const ColorFilter.mode(
                                    MyColors.primaryDark1D1929,
                                    BlendMode.srcIn,
                                  ),
                                  height: 14.h,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 8.w,
                        top: 12.h,
                        bottom: 8.h,
                      ),
                      // height: 100.h,
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
                            AppLocalizations.of(context)?.checkoutToday ??
                            "Checkouts Today",
                            style: myTextStyle.font_14w500,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextView(
                                "124",
                                style: myTextStyle.font_10w400.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.h,
                                  color: MyColors.gray424242,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 4.w),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.todayCheckoutScreen,
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextView(
                                        AppLocalizations.of(context)?.seeNow ??
                                        "See Now",
                                        style: myTextStyle.font_14w500.copyWith(
                                          color: MyColors.primaryDark1D1929,
                                          fontSize: 13.h,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      SvgPicture.asset(
                                        MyIcons.arrowLeft,
                                        colorFilter: const ColorFilter.mode(
                                          MyColors.primaryDark1D1929,
                                          BlendMode.srcIn,
                                        ),
                                        height: 14.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const ServiceRequestWidget(),
          ],
        ),
      ),
    );
  }
}


