import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import '../../view/widgets/common_button.dart';
import 'create_broadcast_screen.dart';

class BroadcastScreen extends StatefulWidget {
  const BroadcastScreen({super.key});

  @override
  State<BroadcastScreen> createState() => _BroadcastScreenState();
}

class _BroadcastScreenState extends State<BroadcastScreen> {
  // Sample broadcast data
  final List<Map<String, dynamic>> broadcasts = [
    {
      'time': '10:10AM',
      'title': 'Guest area readiness before check-in',
      'status': 'Active',
      'message': 'Ensure all guest areas are clean and ready before check-ins.',
      'department': 'Housekeeping',
      'triggerDateTime': '20-06-2025 | 11:30 AM',
    },
    {
      'time': '10:10AM',
      'title': 'Guest area readiness before check-in',
      'status': 'Active',
      'message': 'Ensure all guest areas are clean and ready before check-ins.',
      'department': 'Housekeeping',
      'triggerDateTime': '20-06-2025 | 11:30 AM',
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
                
                // Broadcast list
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 100.h),
                    itemCount: broadcasts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: _buildBroadcastCard(broadcasts[index]),
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
            'Broadcast',
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

  Widget _buildBroadcastCard(Map<String, dynamic> broadcast) {
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
          // Time and Status row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                broadcast['time'],
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.gray979797,
                ),
              ),
              // Status badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: broadcast['status'] == 'Active' 
                      ? Colors.green.withOpacity(0.1) 
                      : MyColors.grayF5F5F5,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  broadcast['status'],
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: broadcast['status'] == 'Active' 
                        ? Colors.green[600] 
                        : MyColors.gray667085,
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Title and Department row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Broadcast Title',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.gray979797,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      broadcast['title'],
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
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Department',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.gray979797,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      broadcast['department'],
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
          
          SizedBox(height: 16.h),
          
          // Message section
          Text(
            'Message',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.gray979797,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            broadcast['message'],
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: MyColors.dark000000,
            ),
          ),
          
          SizedBox(height: 20.h),
          
          // Bottom row with trigger date and button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Broadcast Trigger Date & Time',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.gray979797,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    broadcast['triggerDateTime'],
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: MyColors.dark000000,
                    ),
                  ),
                ],
              ),
              CommonButton(
                text: 'Send Reminder',
                onPressed: () {
                  // Handle send reminder action
                  _showReminderSentMessage();
                },
                type: ButtonType.primary,
                size: ButtonSize.medium,
                customHeight: 48.h,
              ),
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
          // Navigate to create broadcast screen
          _navigateToCreateBroadcast();
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

  void _showReminderSentMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Reminder sent successfully!',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: MyColors.dark000000,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  void _navigateToCreateBroadcast() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateBroadcastScreen(),
      ),
    );
  }
}