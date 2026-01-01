import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

import '../../tasks/view/create_alert_screen.dart';


class AlertListScreen extends StatefulWidget {
  const AlertListScreen({super.key});

  @override
  State<AlertListScreen> createState() => _AlertListScreenState();
}

class _AlertListScreenState extends State<AlertListScreen> {
  List<Map<String, dynamic>> alerts = [
    {
      "id": "ID: 1004",
      "time": "10:10 AM",
      "recipient": "Rahul Niel",
      "department": "Housekeeping",
      "priority": "Urgent",
      "title": "Room A-102 Need Towel",
    },
    {
      "id": "ID: 1005",
      "time": "10:15 AM",
      "recipient": "Sara Khan",
      "department": "Kitchen",
      "priority": "Normal",
      "title": "Kitchen Supply Required",
    },
    {
      "id": "ID: 1006",
      "time": "10:20 AM",
      "recipient": "Ahmad Ali",
      "department": "Maintenance",
      "priority": "High",
      "title": "AC Repair Room 205",
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
                        "Alert",
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 28.sp,
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
             // Search Bar (Optional, if consistent with others)
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
                          hintText: "Search alerts...",
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
                itemCount: alerts.length,
                itemBuilder: (context, index) {
                  final alert = alerts[index];
                  return _buildAlertCard(alert);
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
            MaterialPageRoute(builder: (context) => const CreateAlertScreen()),
          );
        },
        backgroundColor: MyColors.primaryDark1D1929,
        child: const Icon(Icons.add, color: MyColors.whiteFFFFFF),
      ),
    );
  }

  Widget _buildAlertCard(Map<String, dynamic> alert) {
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
          // Alert ID and Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                alert["id"],
                style: myTextStyle.font_14w500.copyWith(color: MyColors.gray9F9F9F), // Larger ID
              ),
              TextView(
                alert["time"],
                style: myTextStyle.font_14w500.copyWith(color: MyColors.gray9F9F9F), // Larger Time
              ),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Recipient, Department, Priority
          Row(
            children: [
              Expanded(
                child: _buildInfoColumn("Recipient", alert["recipient"]),
              ),
              Expanded(
                child: _buildInfoColumn("Department", alert["department"]),
              ),
              Expanded(
                child: _buildInfoColumn("Priority", alert["priority"]),
              ),
            ],
          ),
          
          SizedBox(height: 20.h),
          
          // Notification Title
          TextView(
            "Notification Title",
            style: myTextStyle.font_14w400.copyWith(color: MyColors.gray9F9F9F),
          ),
          SizedBox(height: 6.h),
          TextView(
            alert["title"],
            style: myTextStyle.font_18w600.copyWith(color: MyColors.dark000000, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    Color priorityColor = MyColors.dark000000;
    if (label == "Priority") {
      switch (value.toLowerCase()) {
        case "urgent":
          priorityColor = MyColors.redEA445C;
          break;
        case "high":
          priorityColor = MyColors.yellowFFDB57;
          break;
        case "normal":
          priorityColor = MyColors.green34A853;
          break;
        default:
          priorityColor = MyColors.dark000000;
      }
    }
    
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
          style: myTextStyle.font_16ww600.copyWith(color: priorityColor),
        ),
      ],
    );
  }
}