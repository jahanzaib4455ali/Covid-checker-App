import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'notification_detail_screen.dart';

class ManagerNotificationsScreen extends StatefulWidget {
  const ManagerNotificationsScreen({super.key});

  @override
  State<ManagerNotificationsScreen> createState() => _ManagerNotificationsScreenState();
}

class _ManagerNotificationsScreenState extends State<ManagerNotificationsScreen> {
  // Sample notification data based on Figma design
  final List<Map<String, dynamic>> newNotifications = [
    {
      'time': '5h ago',
      'title': 'Rahul Kumar, Cook',
      'message': 'Sent login request for mobile app',
      'hasViewButton': true,
      'hasMoreMenu': true,
      'notificationType': 'login_request', // Login request type
    },
  ];

  final List<Map<String, dynamic>> otherNotifications = [
    {
      'time': '5h ago',
      'title': 'Low Inventory',
      'message': 'Chicken quantity is below threshold!',
      'hasViewButton': true,
      'hasMoreMenu': true,
      'notificationType': 'maintenance_approval_multi', // Second type
    },
    {
      'time': '5h ago',
      'title': 'Leave Request Submitted',
      'message': 'Rahul, Chef Applies for 2 days leave',
      'hasViewButton': true,
      'hasMoreMenu': true,
      'notificationType': 'leave_request', // Third type
    },
    {
      'time': '10h ago',
      'title': 'Maintenance Required',
      'message': 'Room 101 AC is not working properly',
      'hasViewButton': true,
      'hasMoreMenu': true,
      'notificationType': 'maintenance_repair', // Fourth type
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteFFFFFF,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with back button and title
            Padding(
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
                    'Notifications',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: MyColors.dark000000,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    
                    // New Section with integrated header
                    if (newNotifications.isNotEmpty) ...[
                      _buildNewNotificationCard(newNotifications.first),
                      SizedBox(height: 16.h),
                    ],

                    // Other notifications (regular cards)
                    ...otherNotifications.map((notification) => 
                      _buildNotificationCard(notification)),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewNotificationCard(Map<String, dynamic> notification) {
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        color: MyColors.greenECF9EF, // Light mint/green background for new notifications
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "New" header integrated into the card
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
            child: Text(
              'New',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.dark000000,
              ),
            ),
          ),
          // Notification content
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time and more menu
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification['time'],
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.gray979797,
                      ),
                    ),
                    if (notification['hasMoreMenu'] == true)
                      Icon(
                        Icons.more_horiz,
                        size: 20.w,
                        color: MyColors.gray979797,
                      ),
                  ],
                ),
                SizedBox(height: 8.h),
                // Title and message
                Text(
                  notification['title'],
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: MyColors.dark000000,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  notification['message'],
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: MyColors.gray667085,
                  ),
                ),
                SizedBox(height: 16.h),
                // View button
                if (notification['hasViewButton'] == true)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationDetailScreen(
                            notificationType: notification['notificationType'] ?? 'maintenance_approval',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 80.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: MyColors.dark000000,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notification) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: MyColors.grayEFEFEF, // Very subtle border for regular notifications
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time and more menu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notification['time'],
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.gray979797,
                ),
              ),
              if (notification['hasMoreMenu'] == true)
                Icon(
                  Icons.more_horiz,
                  size: 20.w,
                  color: MyColors.gray979797,
                ),
            ],
          ),

          SizedBox(height: 8.h),

          // Title and message
          Text(
            notification['title'],
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: MyColors.dark000000,
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            notification['message'],
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.gray667085,
            ),
          ),

          SizedBox(height: 16.h),

          // View button
          if (notification['hasViewButton'] == true)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationDetailScreen(
                      notificationType: notification['notificationType'] ?? 'maintenance_approval',
                    ),
                  ),
                );
              },
              child: Container(
                width: 80.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: MyColors.dark000000,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    'View',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}