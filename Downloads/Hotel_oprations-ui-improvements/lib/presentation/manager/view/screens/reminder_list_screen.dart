import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

import '../../tasks/view/create_reminder_screen.dart';

class ReminderListScreen extends StatefulWidget {
  const ReminderListScreen({super.key});

  @override
  State<ReminderListScreen> createState() => _ReminderListScreenState();
}

class _ReminderListScreenState extends State<ReminderListScreen> {
  List<Map<String, dynamic>> reminders = [
    {
      "time": "10:10 AM",
      "title": "Lorem",
      "staffResponsible": "All Departments",
      "status": "Active",
      "repeatType": "Weekly",
      "triggerDate": "23-06-2025",
    },
    {
      "time": "10:30 AM",
      "title": "Lorem",
      "staffResponsible": "All Departments",
      "status": "Active",
      "repeatType": "Weekly",
      "triggerDate": "23-06-2025",
    },
    {
      "time": "10:50 AM",
      "title": "Lorem",
      "staffResponsible": "All Departments",
      "status": "Active",
      "repeatType": "Weekly",
      "triggerDate": "23-06-2025",
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
                        "Reminder",
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
                          hintText: "Search reminders...",
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
                itemCount: reminders.length,
                itemBuilder: (context, index) {
                  final reminder = reminders[index];
                  return _buildReminderCard(reminder);
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
            MaterialPageRoute(builder: (context) => const CreateReminderScreen()),
          );
        },
        backgroundColor: MyColors.primaryDark1D1929,
        child: const Icon(Icons.add, color: MyColors.whiteFFFFFF),
      ),
    );
  }

  Widget _buildReminderCard(Map<String, dynamic> reminder) {
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
          // Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                reminder["time"],
                style: myTextStyle.font_16ww600.copyWith(color: MyColors.primaryDark1D1929),
              ),
              if (reminder["status"] == "Active")
                Container(
                   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                   decoration: BoxDecoration(
                     color: const Color(0xFFECF9EF),
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: TextView("Active", style: myTextStyle.font_12w500.copyWith(color: MyColors.green34A853)),
                ),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Title, Staff Responsible, Status
          Row(
            children: [
              Expanded(
                child: _buildInfoColumn("Title", reminder["title"]),
              ),
              Expanded(
                child: _buildInfoColumn("Staff Responsible", reminder["staffResponsible"]),
              ),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Repeat Type and Trigger Date
          Row(
            children: [
              Expanded(
                child: _buildInfoColumn("Repeat Type", reminder["repeatType"]),
              ),
              Expanded(
                child: _buildInfoColumn("Trigger Date", reminder["triggerDate"]),
              ),
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