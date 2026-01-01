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
  List<Map<String, dynamic>> employees = [
    {
      "name": "Aisha",
      "designation": "Sweeper",
      "department": "Housekeeping",
      "totalAssigned": "25",
    },
    {
      "name": "John",
      "designation": "Floor Supervisor",
      "department": "Housekeeping",
      "totalAssigned": "25",
    },
    {
      "name": "David",
      "designation": "Sweeper",
      "department": "Housekeeping",
      "totalAssigned": "30",
    },
    {
      "name": "Omer",
      "designation": "Sweeper",
      "department": "Housekeeping",
      "totalAssigned": "40",
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
                        "Employee Summary",
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 24.sp, // Slightly smaller than "Tasks" due to length
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
            
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      "Employee Performance",
                      style: myTextStyle.font_20w600.copyWith(color: MyColors.dark000000),
                    ),
                    
                    SizedBox(height: 20.h),
                    
                    // Performance Table
                    Container(
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
                        children: [
                          // Table Header
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                            decoration: BoxDecoration(
                              color: MyColors.grayF7F7F7,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextView(
                                    "Employee",
                                    style: myTextStyle.font_14w600.copyWith(color: MyColors.gray9F9F9F),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextView(
                                    "Designation",
                                    style: myTextStyle.font_14w600.copyWith(color: MyColors.gray9F9F9F),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextView(
                                    "Department",
                                    style: myTextStyle.font_14w600.copyWith(color: MyColors.gray9F9F9F),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextView(
                                    "Total\nAssigned",
                                    style: myTextStyle.font_14w600.copyWith(color: MyColors.gray9F9F9F),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Table Rows
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: employees.length,
                            separatorBuilder: (context, index) => const Divider(
                              height: 1,
                              color: MyColors.grayE5E5E5,
                            ),
                            itemBuilder: (context, index) {
                              final employee = employees[index];
                              return _buildEmployeeRow(employee);
                            },
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeRow(Map<String, dynamic> employee) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextView(
              employee["name"],
              style: myTextStyle.font_16ww600.copyWith(color: MyColors.dark000000),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextView(
              employee["designation"],
              style: myTextStyle.font_14w500.copyWith(color: MyColors.gray9F9F9F),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextView(
              employee["department"],
              style: myTextStyle.font_14w500.copyWith(color: MyColors.gray9F9F9F),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextView(
              employee["totalAssigned"],
              style: myTextStyle.font_16ww600.copyWith(color: MyColors.dark000000),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}