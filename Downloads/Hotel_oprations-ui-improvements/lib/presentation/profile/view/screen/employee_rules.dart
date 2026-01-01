import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:flutter_svg/svg.dart';

class EmployeeRules extends StatelessWidget {
  const EmployeeRules({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: false,
      isProfile: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(width: 12.w),
                  TextView(
                    "Rules & Regulations",
                    style: myTextStyle.font_20wMedium.copyWith(
                      fontSize: 22.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              _buildGreenHeader("Employees Rules & Regulations:"),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextView(
                  "n non dui semper felis consectetur porttitor",
                  style: myTextStyle.font_16ww500.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: MyColors.dark07090D,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextView(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In non dui semper felis consectetur porttitor vitae a orci. Suspendisse quis lacus a est lobortis fringilla...",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 14.sp,
                    color: const Color(0xff847C7C),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              _buildGreenHeader("Employees Rules & Regulations:"),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildNumberedList(),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextView(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 14.sp,
                    color: const Color(0xff847C7C),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextView(
                  "Fusce dignissim massa eu turpis ultricies, vel rhoncus turpis luctus...",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 14.sp,
                    color: const Color(0xff847C7C),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGreenHeader(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: MyColors.primaryDark1D1929,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: TextView(
        text,
        style: myTextStyle.font_14w400.copyWith(
          fontSize: 14.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildNumberedList() {
    List<String> items = [
      "Lorem ipsum dolor sit amet, consectetur adipiscing",
      "Lorem ipsum dolor sit amet, consectetur adipiscing",
      "Lorem ipsum dolor sit amet, consectetur adipiscing",
      "Lorem ipsum dolor sit amet, consectetur adipiscing",
      "Lorem ipsum dolor sit amet, consectetur adipiscing",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        items.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: TextView(
            "${index + 1}. ${items[index]}",
            style: myTextStyle.font_14w400.copyWith(
              fontSize: 14.sp,
              color: MyColors.dark07090D,
            ),
          ),
        ),
      ),
    );
  }
}
