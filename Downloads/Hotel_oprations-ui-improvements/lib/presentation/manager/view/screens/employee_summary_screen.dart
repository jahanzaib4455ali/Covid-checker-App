import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class EmployeeSummaryScreen extends StatefulWidget {
  const EmployeeSummaryScreen({super.key});

  @override
  State<EmployeeSummaryScreen> createState() => _EmployeeSummaryScreenState();
}

class _EmployeeSummaryScreenState extends State<EmployeeSummaryScreen> {
  // Data list based on your screenshot
  final List<Map<String, dynamic>> employees = [
    {"name": "Aisha", "designation": "Sweeper", "department": "Housekeeping", "total": "25"},
    {"name": "John", "designation": "Floor Supervisor", "department": "Housekeeping", "total": "25"},
    {"name": "David", "designation": "Sweeper", "department": "Housekeeping", "total": "30"},
    {"name": "Omer", "designation": "Sweeper", "department": "Housekeeping", "total": "40"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 60.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFFF2F4F7),
              child: Icon(Icons.arrow_back, color: Colors.black, size: 20),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: TextView(
          "Employee Summary",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w800,
            color: Colors.black,
            fontFamily: 'Plus Jakarta Sans',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: TextView(
                "Employee Performance",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),

            // Custom Table Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFFEAECF0)),
                  bottom: BorderSide(color: Color(0xFFEAECF0)),
                ),
              ),
              child: Row(
                children: [
                  _headerCell("Employee", flex: 3),
                  _headerCell("Designation", flex: 3),
                  _headerCell("Department", flex: 3),
                  _headerCell("Total Assigned", flex: 2),
                ],
              ),
            ),

            // Table Body
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: employees.length,
              separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFEAECF0)),
              itemBuilder: (context, index) {
                final emp = employees[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
                  child: Row(
                    children: [
                      _dataCell(emp["name"]!, flex: 3, isBold: true),
                      _dataCell(emp["designation"]!, flex: 3),
                      _dataCell(emp["department"]!, flex: 3),
                      _dataCell(emp["total"]!, flex: 2, textAlign: TextAlign.center),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerCell(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: TextView(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xFF667085),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _dataCell(String text, {required int flex, bool isBold = false, TextAlign textAlign = TextAlign.start}) {
    return Expanded(
      flex: flex,
      child: TextView(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: 14.sp,
          color: isBold ? Colors.black : const Color(0xFF1D2939),
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}