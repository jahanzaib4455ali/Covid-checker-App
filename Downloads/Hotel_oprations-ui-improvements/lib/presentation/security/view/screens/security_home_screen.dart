import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/presentation/security/view/widgets/security_home_button.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';

import '../../../../l10n/app_localizations.dart';


class SecurityHomeScreen extends StatelessWidget {
  const SecurityHomeScreen({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Row(
                children: [
                  SecurityHomeButton(
                    text: AppLocalizations.of(context)?.guestCheckInOut ?? "Guest Check in - Check Out",
                    onTap: () {
                      Navigator.pushNamed(context, Routes.guestCheckInScreen);
                    },
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  SecurityHomeButton(
                    text: AppLocalizations.of(context)?.vehiclesInOut ?? "Vehicles Incoming - Outgoing",
                    onTap: () {
                      Navigator.pushNamed(context, Routes.vehicleInOutScreen);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Row(
                children: [
                  SecurityHomeButton(
                    text: AppLocalizations.of(context)?.vendorOrderReceived ?? "Vendor Order Recieved",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.vendorOrderInScreen,
                      );
                    },
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  SecurityHomeButton(
                    text: AppLocalizations.of(context)?.employeesInOut ?? "Employees Incoming - Outgoing",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.employeeIncomingOutgoingScreen,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
