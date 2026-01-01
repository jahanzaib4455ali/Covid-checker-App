import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/my_text_field.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';

import '../../../../l10n/app_localizations.dart';


class VehicleInOutScreen extends StatefulWidget {
  const VehicleInOutScreen({super.key});

  @override
  State<VehicleInOutScreen> createState() => _VehicleInOutScreenState();
}

class _VehicleInOutScreenState extends State<VehicleInOutScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

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
                    AppLocalizations.of(context)?.todayVehicleInOutHistory ?? "Today vehicle in-out history",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    child: TabBar(
                      controller: tabController,
                      tabAlignment: TabAlignment.fill,
                      dividerColor: MyColors.greenCDEADE,
                      dividerHeight: 2,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: MyColors.primaryDark1D1929,
                      unselectedLabelColor: MyColors.dark242424,
                      labelColor: MyColors.primaryDark1D1929,
                      labelStyle: myTextStyle.font_14w500.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.h,
                      ),
                      unselectedLabelStyle: myTextStyle.font_16ww400,
                      tabs: [
                        Tab(text:  AppLocalizations.of(context)?.incomingHistory ?? "Incoming  History"),
                        Tab(text:  AppLocalizations.of(context)?.outgoingHistory ?? "Outgoing History"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextFormField(
                    radius: BorderRadius.circular(7),
                    prefixWidth: 40.w,
                    textFieldColor: MyColors.grayF7F7F8,
                    isFilled: true,
                    borderColor: MyColors.grayD0D5DD,
                    margin: EdgeInsets.symmetric(horizontal: 22.w),
                    hintText: AppLocalizations.of(context)?.search ?? "Search",
                    prefixIcon: SvgPicture.asset(
                      MyIcons.search,
                      fit: BoxFit.none,
                    ),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 20,
                            itemBuilder: (context, i) {
                              return const VehicleInOutTile();
                            }),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 20,
                            itemBuilder: (context, i) {
                              return const VehicleInOutTile(
                                isOutgoing: true,
                              );
                            }),
                      ],
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

class VehicleInOutTile extends StatelessWidget {
  const VehicleInOutTile({super.key, this.isOutgoing});

  final bool? isOutgoing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 11.h),
      margin: EdgeInsets.only(
        left: 14.w,
        right: 13.w,
        bottom: 4.2.h,
      ),
      height: 260.h,
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
                            AppLocalizations.of(context)?.vehicleNumber ?? "Vehicle Number",
                            style: myTextStyle.font_14w400.copyWith(
                              color: MyColors.gray979797,
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          TextView(
                            "A-0012",
                            style: myTextStyle.font_14w500.copyWith(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              AppLocalizations.of(context)?.purpose ?? "Purpose",
                              style: myTextStyle.font_14w400.copyWith(
                                color: MyColors.gray979797,
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Flexible(
                              child: TextView(
                                "Lorem ipsum dolor sit.",
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
                  width: 12.h,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            AppLocalizations.of(context)?.driverName ?? "Driver Name",
                            style: myTextStyle.font_14w400.copyWith(
                              color: MyColors.gray979797,
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          TextView(
                            "Rakesh Kumar",
                            style: myTextStyle.font_14w500.copyWith(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            AppLocalizations.of(context)?.securityGuardName ?? "Security Guard Name",
                            style: myTextStyle.font_14w400.copyWith(
                              color: MyColors.gray979797,
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          TextView(
                            "Bhuvam k.",
                            style: myTextStyle.font_14w500.copyWith(),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.incomingVehicleScreen);
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
