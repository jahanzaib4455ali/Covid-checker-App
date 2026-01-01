import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'create_reminder_screen.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  // Sample reminder data
  final List<Map<String, dynamic>> reminders = [
    {
      'time': '10:10AM',
      'title': 'Lorem',
      'staffResponsible': 'All Departments',
      'status': 'Active',
      'repeatType': 'Weekly',
      'triggerDate': '23-06-2025',
    },
    {
      'time': '10:10AM',
      'title': 'Lorem',
      'staffResponsible': 'All Departments',
      'status': 'Active',
      'repeatType': 'Weekly',
      'triggerDate': '23-06-2025',
    },
    {
      'time': '10:10AM',
      'title': 'Lorem',
      'staffResponsible': 'All Departments',
      'status': 'Active',
      'repeatType': 'Weekly',
      'triggerDate': '23-06-2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteFFFFFF,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with back button and title
                _buildHeader(),
                
                SizedBox(height: 20.h),
                
                // Reminder list
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 100.h),
                    itemCount: reminders.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: _buildReminderCard(reminders[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
            
            // Floating add button
            _buildFloatingAddButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: MyColors.grayF5F5F5,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.arrow_back,
                size: 20.w,
                color: MyColors.dark000000,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          TextView(
            'Reminder',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: MyColors.dark000000,
              letterSpacing: -0.5,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              // Filter icon
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Icon(
                  Icons.tune,
                  size: 24.w,
                  color: MyColors.dark000000,
                ),
              ),
              // Date chip
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: MyColors.whiteFFFFFF,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: MyColors.grayD0D5DD.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 16.w,
                      color: MyColors.dark000000,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      '11-01-2023',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.dark000000,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReminderCard(Map<String, dynamic> reminder) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: MyColors.grayD0D5DD.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time
          Text(
            reminder['time'],
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.gray979797,
            ),
          ),
          
          SizedBox(height: 16.h),
          
          // First row: Title, Staff Responsible, Status
          Row(
            children: [
              // Title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.gray979797,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      reminder['title'],
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.dark000000,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
              // Staff Responsible
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Staff Responsible',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.gray979797,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      reminder['staffResponsible'],
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.dark000000,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
              // Status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.gray979797,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      reminder['status'],
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.dark000000,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          SizedBox(height: 20.h),
          
          // Divider line
          Container(
            height: 1.h,
            color: MyColors.grayD0D5DD.withOpacity(0.3),
          ),
          
          SizedBox(height: 20.h),
          
          // Second row: Repeat Type and Trigger Date
          Row(
            children: [
              // Repeat Type
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Repeat Type',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.gray979797,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      reminder['repeatType'],
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.dark000000,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
              // Trigger Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trigger Date',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.gray979797,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      reminder['triggerDate'],
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.dark000000,
                      ),
                    ),
                  ],
                ),
              ),
              // Empty space to balance layout (since original has 3 columns in first row)
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingAddButton() {
    return Positioned(
      right: 20.w,
      bottom: 20.h,
      child: GestureDetector(
        onTap: () {
          // Navigate to create reminder screen
          _navigateToCreateReminder();
        },
        child: Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 28.w,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToCreateReminder() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateReminderScreen(),
      ),
    );
  }
}