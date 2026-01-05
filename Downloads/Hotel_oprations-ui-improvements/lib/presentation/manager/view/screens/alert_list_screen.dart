import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'alert_screen.dart';

// Note: Replace these imports with your actual project paths
// import 'package:kunggy_operational_app/common/widget/text_view.dart';

class AlertListScreen extends StatefulWidget {
  const AlertListScreen({super.key});

  @override
  State<AlertListScreen> createState() => _AlertListScreenState();
}

class _AlertListScreenState extends State<AlertListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 70.w,
        centerTitle: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            icon: CircleAvatar(
              backgroundColor: const Color(0xFFF2F4F7),
              child: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          "Alert",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.black,
            fontFamily: 'Plus Jakarta Sans',
          ),
        ),
        actions: [
          Icon(Icons.search, color: Colors.black, size: 24.sp),
          SizedBox(width: 12.w),
          Icon(Icons.tune, color: Colors.black, size: 24.sp),
          SizedBox(width: 12.w),
          _buildDateFilter(),
          SizedBox(width: 15.w),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        itemCount: 3,
        itemBuilder: (context, index) {
          return _buildAlertCard(index == 0); // Pehla card collapsed dikhane ke liye
        },
      ),
      // Floating Action Button in AlertListScreen
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Button press karte hi ye screen open hogi
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateAlertScreen()),
          );
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildDateFilter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD0D5DD)),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today_outlined, size: 14.sp, color: Colors.black),
          SizedBox(width: 6.w),
          Text(
            "11-01-2023",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard(bool isCollapsed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time Label above card
        Padding(
          padding: EdgeInsets.only(left: 5.w, bottom: 8.h, top: 10.h),
          child: Text(
            "10:10AM",
            style: TextStyle(
              fontSize: 13.sp,
              color: const Color(0xFF667085),
              fontFamily: 'Plus Jakarta Sans',
            ),
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFFEAECF0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: Recipient | Department | Priority
                  Padding(
                    padding: EdgeInsets.all(15.w),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoColumn("Recipient", "Rahul Niel"),
                          _vDivider(),
                          _buildInfoColumn("Department", "Housekeeping"),
                          _vDivider(),
                          _buildInfoColumn("Priority", "Urgent", isUrgent: true),
                        ],
                      ),
                    ),
                  ),

                  // Expanded Section (Notification Title)
                  if (!isCollapsed) ...[
                    const Divider(height: 1, color: Color(0xFFEAECF0), thickness: 1),
                    Padding(
                      padding: EdgeInsets.all(15.w),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Notification Title",
                                  style: TextStyle(fontSize: 12.sp, color: const Color(0xFF98A2B3)),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "Room A-102 Need Towel",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            // Optional Vertical line if needed like in screenshot
                            _vDivider(),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Circular Arrow Icon for Collapsed Card
            if (isCollapsed)
              Positioned(
                bottom: -12.h,
                right: 20.w,
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFEAECF0)),
                  ),
                  child: Icon(Icons.keyboard_arrow_down, size: 20.sp, color: const Color(0xFFD0D5DD)),
                ),
              ),
          ],
        ),
        SizedBox(height: 15.h),
      ],
    );
  }

  Widget _buildInfoColumn(String label, String value, {bool isUrgent = false}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, color: const Color(0xFF98A2B3)),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: isUrgent ? const Color(0xFFB42318) : Colors.black,
              fontFamily: 'Plus Jakarta Sans',
            ),
          ),
        ],
      ),
    );
  }

  Widget _vDivider() {
    return Container(
      height: 35.h,
      width: 1.2,
      color: const Color(0xFFEAECF0),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
    );
  }
}