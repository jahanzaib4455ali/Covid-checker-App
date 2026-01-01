import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_loader_elevated_button.dart';
import 'package:kunggy_operational_app/common/widget/my_text_field.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';


import '../../../../l10n/app_localizations.dart';

class IncomingVehicleScreen extends StatefulWidget {
  const IncomingVehicleScreen({super.key});

  @override
  State<IncomingVehicleScreen> createState() => _IncomingVehicleScreenState();
}

class _IncomingVehicleScreenState extends State<IncomingVehicleScreen> {
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
              padding: EdgeInsets.only(left: 23.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                        width: 8.w,
                      ),
                      TextView(
                        AppLocalizations.of(context)?.incomingVehicles ?? "Incoming Vehicles",
                        style: myTextStyle.font_20wMedium.copyWith(
                          fontSize: 20.h,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.vehicleInOutScreen);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                      ),
                      height: 38.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: MyColors.primaryDark1D1929,
                      ),
                      child: TextView(
                        AppLocalizations.of(context)?.todayHistory ?? "Today History",
                        style: myTextStyle.font_14w400.copyWith(
                          fontWeight: FontWeight.w600,
                          color: MyColors.whiteFFFFFF,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      AppLocalizations.of(context)?.vehicleNo ?? "Vehicle No",
                      style: myTextStyle.font_16ww500,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(
                      borderColor: MyColors.grayD0D5DD,
                      hintText: "",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextView(
                      AppLocalizations.of(context)?.driverName ?? "Driver Name",
                      style: myTextStyle.font_16ww500,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(
                      borderColor: MyColors.grayD0D5DD,
                      hintText: "",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextView(
                      AppLocalizations.of(context)?.purpose ?? "Purpose",
                      style: myTextStyle.font_16ww500,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(
                      borderColor: MyColors.grayD0D5DD,
                      hintText: "",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextView(
                      AppLocalizations.of(context)?.gateNo ?? "Gate No",
                      style: myTextStyle.font_16ww500,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(
                      borderColor: MyColors.grayD0D5DD,
                      hintText: "",
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    MyLoaderElvButton(
                      borderRadius: 10,
                      height: 48.h,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: AppLocalizations.of(context)?.inButton ?? "IN",
                      state: null,
                      textStyle: myTextStyle.font_25wRegular.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.h,
                        color: MyColors.whiteFFFFFF,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
