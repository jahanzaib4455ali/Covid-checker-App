import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

class AlertCard extends StatelessWidget {
  final String time;
  final String recipient;
  final String department;
  final String priority;
  final String? notificationTitle;
  final VoidCallback? onTap;
  final bool showExpandIcon;

  const AlertCard({
    super.key,
    required this.time,
    required this.recipient,
    required this.department,
    required this.priority,
    this.notificationTitle,
    this.onTap,
    this.showExpandIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: MyColors.whiteFFFFFF,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: MyColors.grayEFEFEF,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: Offset(0, 2),
              blurRadius: 8,
              spreadRadius: 0,
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
                Text(
                  time,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: MyColors.gray979797,
                  ),
                ),
                if (showExpandIcon)
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: MyColors.gray979797,
                    size: 20.w,
                  ),
              ],
            ),
            
            SizedBox(height: 12.h),
            
            // Alert details
            Row(
              children: [
                // Recipient
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recipient',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.gray979797,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        recipient,
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: MyColors.dark000000,
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(width: 16.w),
                
                // Department
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Department',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.gray979797,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        department,
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: MyColors.dark000000,
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(width: 16.w),
                
                // Priority
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Priority',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.gray979797,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        priority,
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: priority.toLowerCase() == 'urgent' 
                              ? Colors.red 
                              : MyColors.dark000000,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            // Notification title if provided
            if (notificationTitle != null) ...[
              SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notification Title',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.gray979797,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    notificationTitle!,
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.dark000000,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}