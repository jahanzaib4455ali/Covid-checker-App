import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 25.w, right: 22.w),
            padding: EdgeInsets.only(
                left: 17.w, right: 17.w, top: 13.h, bottom: 15.h),
            decoration: BoxDecoration(
              color: MyColors.primaryDark1D1929.withOpacity(0.09),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: MyColors.primaryDark1D1929,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  "Today Important Notices",
                  style: myTextStyle.font_16ww500.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.h,
                    color: MyColors.primaryDark1D1929,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                TextView(
                  "Lorem ipsum dolor sit amet, consect adipiscing elit. Sed id enim semper, vulputate. Lorem ipsum dolor sit amet, consect adipiscing elit. Sed id enim semper, vulputate.",
                  style: myTextStyle.font_10w400.copyWith(
                    color: MyColors.primaryDark1D1929,
                    fontSize: 11.h,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          TextView(
            padding: EdgeInsets.only(
              left: 17.w,
            ),
            "Hey Rajeev",
            style: myTextStyle.font_32w700.copyWith(
              fontSize: 25.h,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          TextView(
            padding: EdgeInsets.only(
              left: 17.w,
            ),
            "Welcome back to your dashboard!",
            style: myTextStyle.font_10w400.copyWith(
              fontSize: 15.h,
              color: MyColors.dark000000.withOpacity(0.6),
            ),
          ),
          SizedBox(
            height: 33.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 22.w),
            child: Row(
              children: [
                const Expanded(
                  child: HomeContainer(
                    text1: "Total bookings",
                    text2: "2400",
                  ),
                ),
                SizedBox(
                  width: 11.w,
                ),
                const Expanded(
                  child: HomeContainer(
                    text1: "Occupancy",
                    text2: "3567",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 22.w),
            child: Row(
              children: [
                const Expanded(
                  child: HomeContainer(
                    text1: "Total check-ins",
                    text2: "14,382",
                  ),
                ),
                SizedBox(
                  width: 11.w,
                ),
                const Expanded(
                  child: HomeContainer(
                    text1: "Total check-outs",
                    text2: "14,382",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 22.w),
            child: Row(
              children: [
                const Expanded(
                  child: HomeContainer(
                    text1: "Rooms Available ",
                    text2: "14,382",
                  ),
                ),
                SizedBox(
                  width: 11.w,
                ),
                const Expanded(
                  child: HomeContainer(
                    text1: "Pending check-outs",
                    text2: "14,382",
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

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    required this.text1,
    required this.text2,
  });

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: MyColors.grayD0D5DD,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text1,
            style: myTextStyle.font_10w500
                .copyWith(fontSize: 14.h, color: MyColors.gray71717A),
          ),
          TextView(
            text2,
            style: myTextStyle.font_32w700.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 33.h,
              color: MyColors.dark434343,
            ),
          ),
        ],
      ),
    );
  }
}
