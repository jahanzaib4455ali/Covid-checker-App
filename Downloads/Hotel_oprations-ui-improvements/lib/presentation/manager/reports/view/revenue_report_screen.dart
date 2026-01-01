import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class RevenueReportScreen extends StatefulWidget {
  const RevenueReportScreen({super.key});

  @override
  State<RevenueReportScreen> createState() => _RevenueReportScreenState();
}

class _RevenueReportScreenState extends State<RevenueReportScreen> {
  // Sample data for the table
  final List<Map<String, dynamic>> tableData = [
    {
      'date': '6-4-2025',
      'bookings': '298',
      'revenue': '\$79,985',
      'occupancy': '94%',
    },
    {
      'date': '6-4-2025',
      'bookings': '298',
      'revenue': '\$79,985',
      'occupancy': '94%',
    },
    {
      'date': '6-4-2025',
      'bookings': '298',
      'revenue': '\$79,985',
      'occupancy': '94%',
    },
    {
      'date': '6-4-2025',
      'bookings': '298',
      'revenue': '\$79,985',
      'occupancy': '94%',
    },
    {
      'date': '6-4-2025',
      'bookings': '298',
      'revenue': '\$79,985',
      'occupancy': '94%',
    },
    {
      'date': '6-4-2025',
      'bookings': '298',
      'revenue': '\$79,985',
      'occupancy': '94%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteFFFFFF,
      appBar: AppBar(
        backgroundColor: MyColors.whiteFFFFFF,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColors.dark000000),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextView(
          'Revenue Report',
          style: myTextStyle.font_18w600.copyWith(color: MyColors.dark000000),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.grayD0D5DD),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today, size: 16.w, color: MyColors.dark000000),
                SizedBox(width: 5.w),
                TextView(
                  "11-01-2023",
                  style: myTextStyle.font_12w400.copyWith(color: MyColors.dark000000),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: myTextStyle.font_14w400.copyWith(color: MyColors.gray9F9F9F),
                      prefixIcon: const Icon(Icons.search, color: MyColors.gray9F9F9F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: MyColors.grayF7F7F7,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColors.grayD0D5DD),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.tune, size: 20.w, color: MyColors.gray9F9F9F),
                ),
              ],
            ),
          ),

          // Table Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextView(
              'Revenue Report Table',
              style: myTextStyle.font_18w600.copyWith(color: MyColors.dark000000),
            ),
          ),

          SizedBox(height: 16.h),

          // Table Header
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: MyColors.grayE5E5E5, width: 1),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextView(
                    'Date',
                    style: myTextStyle.font_14w600.copyWith(color: MyColors.gray9F9F9F),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextView(
                    'Bookings',
                    style: myTextStyle.font_14w600.copyWith(color: MyColors.gray9F9F9F),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextView(
                    'Revenue',
                    style: myTextStyle.font_14w600.copyWith(color: MyColors.gray9F9F9F),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextView(
                    'Occupancy',
                    style: myTextStyle.font_14w600.copyWith(color: MyColors.gray9F9F9F),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),

          // Table Data
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: tableData.length,
              itemBuilder: (context, index) {
                final data = tableData[index];
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: MyColors.grayEFEFEF, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextView(
                          data['date'],
                          style: myTextStyle.font_14w500.copyWith(color: MyColors.dark000000),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextView(
                          data['bookings'],
                          style: myTextStyle.font_14w500.copyWith(color: MyColors.dark000000),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextView(
                          data['revenue'],
                          style: myTextStyle.font_14w500.copyWith(color: MyColors.dark000000),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextView(
                          data['occupancy'],
                          style: myTextStyle.font_14w500.copyWith(color: MyColors.dark000000),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}