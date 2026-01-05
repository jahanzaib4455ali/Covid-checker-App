import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

import 'package:kunggy_operational_app/common/widget/src_general_scaffold.dart';

import '../screens/revenue_report_screen.dart';

class ViewReportsScreen extends StatefulWidget {
  const ViewReportsScreen({super.key});

  @override
  State<ViewReportsScreen> createState() => _ViewReportsState();
}

class _ViewReportsState extends State<ViewReportsScreen> {
  List<String> reportTypes = [
    "Revenue",
    "Reservation", 
    "Financial",
    "Discount",
    "POS",
    "Guest",
    "Night Audit",
    "Analytical",
    "New Bookings",
    "Housekeeping",
    "Room Service",
    "Kitchen"
  ];

  @override
  Widget build(BuildContext context) {
    return SrcGeneralScaffold(
      backgroundColor: MyColors.whiteFFFFFF,
      isBackButton: false,
      showAppBar: false,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  'Reports',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700, // Bold as per image
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                     // Search Icon
                     IconButton(
                      icon: const Icon(Icons.search, color: MyColors.dark000000, size: 24),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    SizedBox(width: 16.w),
                    IconButton(
                      icon: const Icon(Icons.tune, color: MyColors.dark000000, size: 24),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    SizedBox(width: 16.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.grayD0D5DD),
                        borderRadius: BorderRadius.circular(20), // Pill shape
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.calendar_today_outlined, size: 14.w, color: MyColors.dark000000),
                          SizedBox(width: 8.w),
                          TextView(
                            "11-01-2023",
                            style: myTextStyle.font_12w400.copyWith(
                              color: MyColors.dark000000,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 0.w), // Flush to edges like image? Image has some padding for text, but dividers seem full width? Let's check image again.
              // Image: Text has padding. Dividers seem to have padding too.
              // Let's us standard padding.
              itemCount: reportTypes.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: const Color(0xFFF2F4F7), // Light gray divider
                indent: 24.w,
                endIndent: 24.w,
              ),
              itemBuilder: (context, index) {
                final reportType = reportTypes[index];
                return _buildReportItem(reportType);
              },
            ),
          ),
        ],
      )
    );
  }

  Widget _buildReportItem(String title) {
    return InkWell(
      onTap: () {
        if (title == "Revenue") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RevenueReportScreen()),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          children: [
            Expanded(
              child: TextView(
                title,
                style: myTextStyle.font_16ww500.copyWith(
                  color: const Color(0xFF101828), // Dark text
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
