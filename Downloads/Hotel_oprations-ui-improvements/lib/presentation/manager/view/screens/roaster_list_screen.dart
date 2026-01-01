import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

import 'create_roaster_screen.dart';

class RoasterListScreen extends StatefulWidget {
  const RoasterListScreen({super.key});

  @override
  State<RoasterListScreen> createState() => _RoasterListScreenState();
}

class _RoasterListScreenState extends State<RoasterListScreen> {
  List<Map<String, dynamic>> roasters = [
    {
      "week": "Week 1 (Jan 15-21, 2025)",
      "employee": "Ahmad Ali",
      "department": "Housekeeping",
      "duties": "Room Cleaning, Maintenance",
      "workingDays": "Mon, Wed, Fri",
      "status": "Active"
    },
    {
      "week": "Week 1 (Jan 15-21, 2025)",
      "employee": "Sara Khan",
      "department": "Kitchen",
      "duties": "Food Preparation, Cleaning",
      "workingDays": "Tue, Thu, Sat",
      "status": "Active"
    },
    {
      "week": "Week 2 (Jan 22-28, 2025)",
      "employee": "John Doe",
      "department": "Security",
      "duties": "Night Watch, Patrol",
      "workingDays": "All Days",
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
                        "Roaster Management",
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
                          hintText: "Search roaster...",
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
                itemCount: roasters.length,
                itemBuilder: (context, index) {
                  final roaster = roasters[index];
                  return _buildRoasterCard(roaster);
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
            MaterialPageRoute(builder: (context) => const CreateRoasterScreen()),
          );
        },
        backgroundColor: MyColors.primaryDark1D1929,
        child: const Icon(Icons.add, color: MyColors.whiteFFFFFF),
      ),
    );
  }

  Widget _buildRoasterCard(Map<String, dynamic> roaster) {
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
              Expanded(
                child: TextView(
                  roaster["week"],
                  style: myTextStyle.font_16ww600.copyWith(color: MyColors.primaryDark1D1929),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                 padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: roaster["status"] == "Active" ? MyColors.green34A853.withOpacity(0.1) : MyColors.yellowFFDB57.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextView(
                  roaster["status"],
                  style: myTextStyle.font_12w600.copyWith(
                    color: roaster["status"] == "Active" ? MyColors.green34A853 : MyColors.yellowFFDB57
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
              Expanded(child: _buildInfoColumn("Employee", roaster["employee"])),
              Expanded(child: _buildInfoColumn("Department", roaster["department"])),
            ],
          ),
          
          SizedBox(height: 20.h),
          
          _buildInfoColumn("Duties", roaster["duties"]),
          
          SizedBox(height: 20.h),
          
          _buildInfoColumn("Working Days", roaster["workingDays"]),
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