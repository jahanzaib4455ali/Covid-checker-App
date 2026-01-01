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

class EmployeeIncomingOutgoingScreen extends StatefulWidget {
  const EmployeeIncomingOutgoingScreen({super.key});

  @override
  State<EmployeeIncomingOutgoingScreen> createState() =>
      _EmployeeIncomingOutgoingScreenState();
}

class _EmployeeIncomingOutgoingScreenState
    extends State<EmployeeIncomingOutgoingScreen>
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
      isBackButton: true,
      isProfile: false,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        Tab(text: AppLocalizations.of(context)?.incomingEmployees ?? "Incoming Employees"),
                        Tab(text: AppLocalizations.of(context)?.outgoingEmployees ?? "Outgoing Employees"),
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
                            itemCount: 20,
                            itemBuilder: (context, i) {
                              return const EmployeeIncomingTile();
                            }),
                        ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, i) {
                              return const EmployeeIncomingTile(
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

class EmployeeIncomingTile extends StatelessWidget {
  const EmployeeIncomingTile({super.key, this.isOutgoing});

  final bool? isOutgoing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 14.w,
        right: 13.w,
        bottom: 10.h,
      ),
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: MyColors.grayD0D5DD),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                AppLocalizations.of(context)?.employeeName ?? "Employee Name :",
                style: myTextStyle.font_14w400.copyWith(
                  color: MyColors.gray979797,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextView(
                "Sania Khan",
                style: myTextStyle.font_14w500.copyWith(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                isOutgoing ?? false
                    ? AppLocalizations.of(context)?.gatepassNo ?? "Gatepass No"
                    : AppLocalizations.of(context)?.id ?? "ID",
                style: myTextStyle.font_14w400.copyWith(
                  color: MyColors.gray979797,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextView(
                "0001",
                style: myTextStyle.font_14w500.copyWith(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                isOutgoing ?? false
                    ? AppLocalizations.of(context)?.time ?? "Time"
                    : AppLocalizations.of(context)?.department ?? "Department",
                style: myTextStyle.font_14w400.copyWith(
                  color: MyColors.gray979797,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextView(
                isOutgoing ?? false ? "5:30PM" : "Kitchen",
                style: myTextStyle.font_14w500.copyWith(),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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

            ],
          ),
          const SizedBox(height: 2)
        ],
      ),
    );
  }
}
