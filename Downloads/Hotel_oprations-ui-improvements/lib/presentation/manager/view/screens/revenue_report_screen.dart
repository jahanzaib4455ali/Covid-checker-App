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
  // Screenshot ke mutabiq data
  final List<Map<String, dynamic>> tableData = List.generate(
    6,
        (index) => {
      'date': '6-6-2025',
      'bookings': '298',
      'revenue': '\$79,985',
      'occupancy': '94%',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 70.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFFF2F4F7),
              child: Icon(Icons.arrow_back, color: Colors.black, size: 20),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text("Reports", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800, color: Colors.black)),
        actions: [
          const Icon(Icons.search, color: Colors.black),
          SizedBox(width: 10.w),
          const Icon(Icons.tune, color: Colors.black),
          SizedBox(width: 10.w),
          _buildDateFilter(),
          SizedBox(width: 15.w),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          // Table Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: TextView(
              'Revenue Report Table',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(height: 10.h),

          // Table Header
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFEAECF0)),
                bottom: BorderSide(color: Color(0xFFEAECF0)),
              ),
            ),
            child: Row(
              children: [
                _headerCell('Date', flex: 3),
                _headerCell('Bookings', flex: 2),
                _headerCell('Revenue', flex: 3),
                _headerCell('Occupancy', flex: 2),
              ],
            ),
          ),

          // Table Data List
          Expanded(
            child: ListView.separated(
              itemCount: tableData.length,
              separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFEAECF0)),
              itemBuilder: (context, index) {
                final data = tableData[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      _dataCell(data['date'], flex: 3, isBold: true),
                      _dataCell(data['bookings'], flex: 2),
                      _dataCell(data['revenue'], flex: 3),
                      _dataCell(data['occupancy'], flex: 2),
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

  Widget _buildDateFilter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD0D5DD)),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today_outlined, size: 14.sp, color: Colors.black),
          SizedBox(width: 6.w),
          Text(
            "11-01-2023",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
    );
  }



  Widget _headerCell(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xFF667085),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _dataCell(String text, {required int flex, bool isBold = false}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.black,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}