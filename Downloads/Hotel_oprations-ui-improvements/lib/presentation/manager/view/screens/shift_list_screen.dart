import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

import 'create_shift_screen.dart';

class ShiftListScreen extends StatefulWidget {
  const ShiftListScreen({super.key});

  @override
  State<ShiftListScreen> createState() => _ShiftListScreenState();
}

class _ShiftListScreenState extends State<ShiftListScreen> {
  List<Map<String, dynamic>> shifts = [
    {
      "employee": "Ahmad Ali",
      "department": "Housekeeping",
      "shiftType": "Morning",
      "startTime": "06:00 AM",
      "endTime": "02:00 PM",
      "date": "15-01-2025",
      "status": "Active"
    },
    {
      "employee": "Sara Khan",
      "department": "Kitchen",
      "shiftType": "Evening",
      "startTime": "02:00 PM",
      "endTime": "10:00 PM",
      "date": "15-01-2025",
      "status": "Active"
    },
    {
      "employee": "John Doe",
      "department": "Security",
      "shiftType": "Night",
      "startTime": "10:00 PM",
      "endTime": "06:00 AM",
      "date": "15-01-2025",
      "status": "Pending"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: SafeArea(
        child: Column(
          children: [
             // Custom Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: MyColors.dark000000),
                        padding: EdgeInsets.zero,
                         constraints: const BoxConstraints(),
                        onPressed: () => Navigator.pop(context),
                      ),
                       SizedBox(width: 12.w),
                      TextView(
                        "Shift Management",
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          color: MyColors.dark000000,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: MyColors.whiteFFFFFF,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: MyColors.grayD0D5DD.withOpacity(0.8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_today, size: 16.w, color: MyColors.dark000000),
                        SizedBox(width: 8.w),
                        TextView(
                          "11-01-2023",
                          style: myTextStyle.font_14w500.copyWith(color: MyColors.dark000000),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
             // Search Bar
             Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                   Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        style: myTextStyle.font_14w600,
                        decoration: InputDecoration(
                          hintText: "Search shifts...",
                          hintStyle: myTextStyle.font_14w400.copyWith(color: MyColors.gray9F9F9F),
                          prefixIcon: const Icon(Icons.search, color: MyColors.gray9F9F9F),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                   Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                         BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(Icons.tune, size: 24.w, color: MyColors.gray9F9F9F),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: shifts.length,
                itemBuilder: (context, index) {
                  final shift = shifts[index];
                  return _buildShiftCard(shift);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateShiftScreen()),
          );
        },
        backgroundColor: MyColors.primaryDark1D1929,
        child: const Icon(Icons.add, color: MyColors.whiteFFFFFF),
      ),
    );
  }

  Widget _buildShiftCard(Map<String, dynamic> shift) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                shift["date"],
                style: myTextStyle.font_14w500.copyWith(color: MyColors.gray9F9F9F),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: shift["status"] == "Active" ? MyColors.green34A853.withOpacity(0.1) : MyColors.yellowFFDB57.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextView(
                  shift["status"],
                  style: myTextStyle.font_12w600.copyWith(
                    color: shift["status"] == "Active" ? MyColors.green34A853 : MyColors.yellowFFDB57
                  ),
                ),
              ),
            ],
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: const Divider(height: 1, color: MyColors.grayE5E5E5),
          ),
          
          Row(
            children: [
              Expanded(child: _buildInfoColumn("Employee", shift["employee"])),
              Expanded(child: _buildInfoColumn("Department", shift["department"])),
              Expanded(child: _buildInfoColumn("Shift Type", shift["shiftType"])),
            ],
          ),
          
          SizedBox(height: 20.h),
          
          Row(
            children: [
              Expanded(child: _buildInfoColumn("Start Time", shift["startTime"])),
              Expanded(child: _buildInfoColumn("End Time", shift["endTime"])),
              const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          label,
          style: myTextStyle.font_14w400.copyWith(color: MyColors.gray9F9F9F),
        ),
        SizedBox(height: 6.h),
        TextView(
          value,
          style: myTextStyle.font_16ww600.copyWith(color: MyColors.dark000000),
        ),
      ],
    );
  }
}