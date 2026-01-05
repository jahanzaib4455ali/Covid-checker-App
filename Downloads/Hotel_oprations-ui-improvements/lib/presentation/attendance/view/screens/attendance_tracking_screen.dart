import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';

enum AttendanceState { notWorking, currentlyWorking, endOfDay }

class AttendanceTrackingScreen extends StatefulWidget {
  const AttendanceTrackingScreen({super.key});

  @override
  State<AttendanceTrackingScreen> createState() => _AttendanceTrackingScreenState();
}

class _AttendanceTrackingScreenState extends State<AttendanceTrackingScreen> {
  AttendanceState currentState = AttendanceState.notWorking;
  
  // Sample data - in real app this would come from state management
  String workingHours = "04:46";
  String breakTime = "00:30";
  String idleTime = "00:15";
  String requestDelay = "01:45";
  String nextShiftTimer = "00:00:00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextView(
          "Attendance",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            _buildMainCard(),
            SizedBox(height: 20.h),
            if (currentState == AttendanceState.currentlyWorking) _buildMetricsRow(),
            if (currentState == AttendanceState.endOfDay) _buildSummaryCards(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildStatusBadge(),
          SizedBox(height: 24.h),
          _buildMainContent(),
          SizedBox(height: 32.h),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color badgeColor;
    String statusText;
    
    switch (currentState) {
      case AttendanceState.notWorking:
        badgeColor = const Color(0xFFE53E3E);
        statusText = "Not Working";
        break;
      case AttendanceState.currentlyWorking:
        badgeColor = const Color(0xFF38A169);
        statusText = "Currently Working";
        break;
      case AttendanceState.endOfDay:
        badgeColor = const Color(0xFF4A5568);
        statusText = "Work Completed";
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TextView(
        statusText,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    switch (currentState) {
      case AttendanceState.notWorking:
        return _buildNotWorkingContent();
      case AttendanceState.currentlyWorking:
        return _buildWorkingContent();
      case AttendanceState.endOfDay:
        return _buildEndOfDayContent();
    }
  }

  Widget _buildNotWorkingContent() {
    return Column(
      children: [
        TextView(
          "Next Shift Start in",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF4A5568),
          ),
        ),
        SizedBox(height: 16.h),
        TextView(
          nextShiftTimer,
          style: TextStyle(
            fontSize: 48.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            letterSpacing: 2.0,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTimeLabel("DD"),
            SizedBox(width: 40.w),
            _buildTimeLabel("MM"),
            SizedBox(width: 40.w),
            _buildTimeLabel("HH"),
          ],
        ),
      ],
    );
  }

  Widget _buildWorkingContent() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTimeMetric("Working Hours", workingHours),
            TextView(
              "Time Details",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF3182CE),
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEndOfDayContent() {
    return Column(
      children: [
        TextView(
          "Total Working Hours",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF4A5568),
          ),
        ),
        SizedBox(height: 8.h),
        TextView(
          workingHours,
          style: TextStyle(
            fontSize: 36.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.h),
        TextView(
          "Great work today! 🎉",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF38A169),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricsRow() {
    return Row(
      children: [
        Expanded(child: _buildMetricCard("Request Delay", requestDelay)),
        SizedBox(width: 12.w),
        Expanded(child: _buildMetricCard("Break Time", breakTime)),
        SizedBox(width: 12.w),
        Expanded(child: _buildMetricCard("Idle Time", idleTime)),
      ],
    );
  }

  Widget _buildSummaryCards() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildSummaryCard("Total Hours", workingHours, Icons.access_time)),
            SizedBox(width: 12.w),
            Expanded(child: _buildSummaryCard("Break Time", breakTime, Icons.coffee)),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(child: _buildSummaryCard("Idle Time", idleTime, Icons.pause_circle)),
            SizedBox(width: 12.w),
            Expanded(child: _buildSummaryCard("Efficiency", "94%", Icons.trending_up)),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricCard(String label, String value) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          TextView(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF718096),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          TextView(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String label, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 24.sp, color: const Color(0xFF4A5568)),
          SizedBox(height: 8.h),
          TextView(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF718096),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          TextView(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeLabel(String label) {
    return TextView(
      label,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF718096),
      ),
    );
  }

  Widget _buildTimeMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF718096),
          ),
        ),
        SizedBox(height: 4.h),
        TextView(
          value,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    switch (currentState) {
      case AttendanceState.notWorking:
        return _buildPunchInButton();
      case AttendanceState.currentlyWorking:
        return _buildWorkingButtons();
      case AttendanceState.endOfDay:
        return _buildEndOfDayButtons();
    }
  }

  Widget _buildPunchInButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () => setState(() => currentState = AttendanceState.currentlyWorking),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3182CE),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          elevation: 0,
        ),
        child: TextView(
          "Punch In",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildWorkingButtons() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48.h,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFE2E8F0)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              ),
              child: TextView(
                "Take a Break",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF4A5568),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: SizedBox(
            height: 48.h,
            child: ElevatedButton(
              onPressed: () => setState(() => currentState = AttendanceState.endOfDay),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE53E3E),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                elevation: 0,
              ),
              child: TextView(
                "End of Day",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEndOfDayButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFE2E8F0)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            ),
            child: TextView(
              "View Detailed Report",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4A5568),
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: () => setState(() => currentState = AttendanceState.notWorking),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF38A169),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              elevation: 0,
            ),
            child: TextView(
              "Start New Day",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}