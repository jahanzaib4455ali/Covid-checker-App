import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/common/widget/expandable_status_card.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'create_alert_screen.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  int? expandedIndex;
  
  // Sample alert data matching the image
  final List<Map<String, dynamic>> alertData = [
    {
      'time': '10:10AM',
      'header': [
        {'label': 'Recipient', 'value': 'Rahul Niel'},
        {'label': 'Department', 'value': 'Housekeeping'},
        {'label': 'Priority', 'value': 'Urgent'},
      ],
      'details': null,
    },
    {
      'time': '10:10AM',
      'header': [
        {'label': 'Recipient', 'value': 'Rahul Niel'},
        {'label': 'Department', 'value': 'Housekeeping'},
        {'label': 'Priority', 'value': 'Urgent'},
      ],
      'details': {
        'notificationTitle': 'Room A-102 Need Towel',
      },
    },
    {
      'time': '10:10AM',
      'header': [
        {'label': 'Recipient', 'value': 'Rahul Niel'},
        {'label': 'Department', 'value': 'Housekeeping'},
        {'label': 'Priority', 'value': 'Urgent'},
      ],
      'details': {
        'notificationTitle': 'Room A-102 Need Towel',
      },
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
                // Header with back button, title and controls
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
                        'Alert',
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
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
                ),
                
                SizedBox(height: 20.h),
                
                // Alert list
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: alertData.length,
                    itemBuilder: (context, index) {
                      final alert = alertData[index];
                      final expanded = expandedIndex == index;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: ExpandableStatusCard(
                          timeLabel: alert['time'],
                          headerColumns: List<Map<String, String>>.from(alert['header']),
                          expanded: expanded,
                          onToggle: () => setState(() {
                            expandedIndex = expanded ? null : index;
                          }),
                          details: alert['details'] != null
                              ? _AlertDetails(details: alert['details'])
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            
            // Floating add button
            Positioned(
              right: 20.w,
              bottom: 20.h,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateAlertScreen(),
                    ),
                  );
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
            ),
          ],
        ),
      ),
    );
  }


}

class _AlertDetails extends StatelessWidget {
  final Map<String, dynamic> details;
  
  const _AlertDetails({required this.details});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (details['notificationTitle'] != null) ...[
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
              details['notificationTitle'],
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.dark000000,
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ],
      ),
    );
  }
}
