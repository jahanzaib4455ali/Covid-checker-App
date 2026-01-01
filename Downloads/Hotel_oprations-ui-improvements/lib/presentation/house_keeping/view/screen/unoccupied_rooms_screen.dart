import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/my_text_field.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/presentation/house_keeping/view/screen/qr_scanner_screen.dart';

import '../../../../l10n/app_localizations.dart';


class UnoccupiedRoomsScreen extends StatefulWidget {
  const UnoccupiedRoomsScreen({super.key});

  @override
  UnoccupiedRoomsScreenState createState() => UnoccupiedRoomsScreenState();
}

class UnoccupiedRoomsScreenState extends State<UnoccupiedRoomsScreen> {
  Map<int, bool> completedRooms = {};

  Future<void> _handleAcceptAndStart(int index) async {
    try {
      final result = await Navigator.push<String>(
        context,
        MaterialPageRoute(builder: (context) => const QRScannerScreen()),
      );

      if (result != null && mounted) {
        // Show success dialog
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: [
                  const Icon(Icons.check_circle, color: MyColors.primaryDark1D1929),
                  SizedBox(width: 10.w),
                  const Text('Success'),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('QR Code scanned successfully!'),
                  SizedBox(height: 8.h),
                  Text('Room verified: $result'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      completedRooms[index] = true;
                    });
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: MyColors.primaryDark1D1929),
                  ),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      ('Error handling QR scan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        CustomTextFormField(
          radius: BorderRadius.circular(7),
          prefixWidth: 40.w,
          textFieldColor: MyColors.grayF7F7F8,
          isFilled: true,
          borderColor: MyColors.grayD0D5DD,
          margin: EdgeInsets.symmetric(horizontal: 22.w),
          hintText: "Search",
          prefixIcon: SvgPicture.asset(
            MyIcons.search,
            fit: BoxFit.none,
          ),
        ),
        SizedBox(height: 24.h),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            itemCount: 20,
            itemBuilder: (context, index) {
              final isCompleted = completedRooms[index] ?? false;
              
              return Container(
                margin: EdgeInsets.only(bottom: 14.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyColors.grayD0D5DD),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          AppLocalizations.of(context)?.dustingOnly ?? "Dusting Only",
                          style: myTextStyle.font_14w500.copyWith(
                            fontSize: 16.h,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            TextView(
                              "10:31 AM",
                              style: myTextStyle.font_12w400.copyWith(
                                color: MyColors.gray979797,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            InkWell(
                              onTap: isCompleted ? null : () => _handleAcceptAndStart(index),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: isCompleted
                                      ? MyColors.primaryDark1D1929.withOpacity(0.1)
                                      : MyColors.primaryDark1D1929.withOpacity(0.07),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: TextView(
                                  isCompleted ? AppLocalizations.of(context)?.statusCompleted ?? "Completed" : AppLocalizations.of(context)?.buttonAcceptAndStart ?? "Accept & Start",
                                  style: myTextStyle.font_14w500.copyWith(
                                    color: MyColors.primaryDark1D1929,
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    TextView(
                      "From:",
                      style: myTextStyle.font_12w400.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        TextView(
                          AppLocalizations.of(context)?.roomNoLabel ??
                          "Room No: ",
                          style: myTextStyle.font_12w400.copyWith(
                            color: MyColors.gray979797,
                          ),
                        ),
                        TextView(
                          "101",
                          style: myTextStyle.font_12w400.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 24.w),
                        TextView(
                          AppLocalizations.of(context)?.roomStatus ??
                          "Status: ",
                          style: myTextStyle.font_12w400.copyWith(
                            color: MyColors.gray979797,
                          ),
                        ),
                        TextView(
                           "Unoccupied",
                          style: myTextStyle.font_12w400.copyWith(
                            color: isCompleted ? MyColors.primaryDark1D1929 : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
