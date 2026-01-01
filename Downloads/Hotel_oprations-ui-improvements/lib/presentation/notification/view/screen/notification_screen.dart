import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_elevated_button.dart';
import 'view_chanages_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: true,
      isNotification: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            TextView(
              "Notifications",
              style: myTextStyle.font_20wMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 32.h),
            TextView(
              "Today",
              style: myTextStyle.font_14w500,
            ),
            SizedBox(height: 18.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return NotificationItem(
                    userName: "Aliyaan Smith",
                    time: "Today at 12pm",
                    message: index == 0
                        ? "Changes in access control for role: hr manager"
                        : "Lorem Ipsum Amit Epic",
                    showButton: index == 0, // Show button only for the first item
                  );
                },
              ),
            ),
            SizedBox(height: 18.h ),
            TextView(
              "Yesterday",
              style: myTextStyle.font_14w500,
            ),
            SizedBox(height: 18.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const NotificationItem(
                    userName: "Aliyaan Smith",
                    time: "Yesterday at 12pm",
                    message: "Lorem Ipsum Amit Epic",
                    showButton: false, // No button for yesterday's notifications
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

class NotificationItem extends StatelessWidget {
  final String userName;
  final String time;
  final String message;
  final bool showButton;

  const NotificationItem({
    required this.userName,
    required this.time,
    required this.message,
    this.showButton = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 11.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: MyColors.grayD0D5DD,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46.w,
            height: 46.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(MyImages.user),
              ),
            ),
          ),
          SizedBox(width: 11.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                userName,
                style: myTextStyle.font_12w500.copyWith(
                  fontSize: 13.h,
                ),
              ),
              TextView(
                time,
                style: myTextStyle.font_12w500.copyWith(
                  fontSize: 9.h,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          SizedBox(width: 11.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextView(
                  message,
                  maxLine: 2,
                  overflow: TextOverflow.ellipsis,
                  style: myTextStyle.font_12w500.copyWith(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w300,
                    color: MyColors.gray5D5D5D,
                  ),
                ),
                SizedBox(height: 11.h),
                if (showButton)
                  MyElevatedButton(
                    padding: const EdgeInsets.only(right: 60.0),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    buttonBGColor: MyColors.primaryDark1D1929,
                    // borderRadius: 4,
                    height: 28.h,
                    width: 120.w,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ViewChangesScreen()), // Ensure ViewChangesScreen is defined
                      );
                    },
                    text: "View Changes",
                    textStyle: myTextStyle.font_16ww500.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: MyColors.whiteFFFFFF,
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
