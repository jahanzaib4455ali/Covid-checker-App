import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_loader_elevated_button.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class ViewChangesScreen extends StatefulWidget {
  const ViewChangesScreen({super.key});

  @override
  _ViewChangesScreenState createState() => _ViewChangesScreenState();
}

class _ViewChangesScreenState extends State<ViewChangesScreen> {
  final Map<String, Map<String, bool>> checkboxStates = {
    "All Access": {
      "Edit": false,
      "Add": false,
      "Cancel": false,
      "Delete": false
    },
    "Reservation": {
      "Edit": false,
      "Add": false,
      "Cancel": false,
      "Delete": false
    },
    "Assign Rooms": {
      "Edit": false,
      "Add": false,
      "Cancel": false,
      "Delete": false
    },
    "Reservation History": {
      "Edit": false,
      "Add": false,
      "Cancel": false,
      "Delete": false
    },
    "Micro Access": {
      "Edit": false,
      "Add": false,
      "Cancel": false,
      "Delete": false
    },
  };

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: true,
      isProfile: false,
      isScrollable: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            TextView(
              "Following changes have been made:",
              style: myTextStyle.font_20wMedium
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.h),
            TextView("By Rakesh Kumar", style: myTextStyle.font_14w500),
            SizedBox(height: 32.h),
            _buildRoleNameSection(),
            SizedBox(height: 24.h),
            TextView("Reservation: Current Configuration",
                style: myTextStyle.font_16ww500),
            SizedBox(height: 16.h),
            ...checkboxStates.keys.map((title) => _buildCheckboxRow(title)),
            SizedBox(height: 50.h),
            TextView("Reservation: New Configuration",
                style: myTextStyle.font_16ww500),
            SizedBox(height: 16.h),
            ...checkboxStates.keys.map((title) => _buildCheckboxRow(title)),
            SizedBox(height: 50.h),
            Container(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MyLoaderElvButton(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      borderRadius: 10,
                      height: 50.h,
                      onPressed: () {
                        // Handle Reject
                      },
                      text: "Reject",
                      state: null,
                      textStyle: myTextStyle.font_16ww500.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: MyColors.whiteFFFFFF,
                      ),
                      buttonBGColor: MyColors.red,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: MyLoaderElvButton(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      borderRadius: 10,
                      height: 50.h,
                      onPressed: () {
                        // Handle Accept
                      },
                      text: "Accept",
                      state: null,
                      textStyle: myTextStyle.font_16ww500.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: MyColors.whiteFFFFFF,
                      ),
                      buttonBGColor: MyColors.primaryDark1D1929,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleNameSection() {
    return Container(
      width: 400.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.grayD0D5DD),
        borderRadius: BorderRadius.circular(8),
      ),
      child:
          TextView("Role Name: (HR Manager)", style: myTextStyle.font_16ww500),
    );
  }

  Widget _buildCheckboxRow(String title) {
    return Container(
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.grayD0D5DD),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: TextView(title, style: myTextStyle.font_14w500),
          ),
          if (title == "All Access") ...[
            ...checkboxStates[title]!.keys.map((action) {
              return Column(
                children: [
                  TextView(action, style: myTextStyle.font_12w500),
                  Checkbox(
                    value: checkboxStates[title]![action],
                    activeColor:
                        MyColors.primaryDark1D1929, // Green when checked
                    onChanged: (bool? newValue) {
                      setState(() {
                        checkboxStates[title]![action] = newValue!;
                      });
                    },
                  ),
                ],
              );
            })
            // }).toList(),
          ] else ...[
            ...checkboxStates[title]!.keys.map((action) {
              return Checkbox(
                value: checkboxStates[title]![action], // Allow interaction
                activeColor: MyColors.primaryDark1D1929,
                onChanged: (bool? newValue) {
                  setState(() {
                    checkboxStates[title]![action] = newValue!;
                  });
                },
              );
            }),
          ],
        ],
      ),
    );
  }
}
