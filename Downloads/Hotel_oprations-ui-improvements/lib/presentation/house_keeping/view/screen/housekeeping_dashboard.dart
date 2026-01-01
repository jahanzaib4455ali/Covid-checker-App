import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/src_general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class HousekeepingDashboard extends StatefulWidget {
  const HousekeepingDashboard({super.key});

  @override
  State<HousekeepingDashboard> createState() => _HousekeepingDashboardState();
}

class _HousekeepingDashboardState extends State<HousekeepingDashboard> {
  bool isPunchedIn = true;

  @override
  Widget build(BuildContext context) {
    return SrcGeneralScaffold(
      isBackButton: false,
      isScrollable: true,
      physics: const BouncingScrollPhysics(),
      backgroundColor: const Color(0xffF6F7FB),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),

            /// 🔹 HEADER (Working Status Section)
            _buildDynamicHeader(),
            SizedBox(height: 20.h),

            /// 🔹 BROADCAST SECTION
            _sectionTitle('Today Important Broadcast'),
            _infoCard(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor vulputate.',
            ),
            SizedBox(height: 20.h),

            /// 🔹 HK DASHBOARD SECTION
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _sectionTitle('HK Dashboard'),
                _dateChip('22-02-2023'),
              ],
            ),
            TextView('Welcome to dashboard!', style: myTextStyle.font_12w400.copyWith(color: Colors.grey)),
            SizedBox(height: 12.h),
            _sectionSubtitle('Quick Summary Panel'),
            SizedBox(height: 8.h),
            _buildSummaryGrid(),
            SizedBox(height: 20.h),

            /// 🔹 TASK SUMMARY SECTION
            _sectionSubtitle('Task Summary'),
            SizedBox(height: 8.h),
            _buildTaskSummaryGrid(),

            /// 🔹 ACTIVE TASK & GUEST REQUEST (Punched In Only)
            if (isPunchedIn) ...[
              SizedBox(height: 20.h),
              _sectionSubtitle('Active Task Display'),
              SizedBox(height: 8.h),
              _buildActiveTaskCard(),

              SizedBox(height: 20.h),
              _sectionSubtitle('Guest Request Panel'),
              SizedBox(height: 8.h),
              _buildGuestRequestCard(),
            ],

            // Extra space for bottom navigation
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  // ================= 🔹 MAIN UI COMPONENTS 🔹 =================

  Widget _buildDynamicHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          if (!isPunchedIn) ...[
            _statusBadge('Not Working', MyColors.redEA445C),
            SizedBox(height: 12.h),
            TextView('Next Shift Start in', style: myTextStyle.font_12w400),
            TextView('00:00:00', style: myTextStyle.font_32w700),
            TextView('DD    MM    HH', style: myTextStyle.font_10w400.copyWith(color: Colors.grey)),
            SizedBox(height: 15.h),
            _actionButton('Punch In', MyColors.primaryDark1D1929, () => setState(() => isPunchedIn = true)),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _timeMetric('Working Hours', '04:46'),
                _statusBadge('Currently Working', MyColors.primaryGreen00A35E),
                TextView('Time Details', style: myTextStyle.font_12w500.copyWith(decoration: TextDecoration.underline)),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _timeMetricSmall('Request Delay', '01:45'),
                _timeMetricSmall('Break Time', '03:45'),
                _timeMetricSmall('Idle Time', '00:45'),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(child: _actionButtonOutline('Take a Break', () {})),
                SizedBox(width: 10.w),
                Expanded(child: _actionButtonOutline('End Of Day', () => setState(() => isPunchedIn = false), isDanger: true)),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSummaryGrid() {
    return Column(
      children: [
        _statCardWide('Average Response Time', '10:01', 'Good'),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(child: _statCardSmall('Task Accepted', '29')),
            SizedBox(width: 12.w),
            Expanded(child: _statCardSmall('Room Cleaned', '17')),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(child: _statCardSmall('Guest Requests', '45')),
            SizedBox(width: 12.w),
            Expanded(child: _statCardSmall('Urgent Rooms', '06')),
          ],
        ),
      ],
    );
  }

  Widget _buildTaskSummaryGrid() {
    return Column(
      children: [
        _statCardWide('Average Task Completion Time', '10:01', 'Good'),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(child: _statCardSmall('Total Task Accepted', '34')),
            SizedBox(width: 12.w),
            Expanded(child: _statCardSmall('Task Completed', '29')),
          ],
        ),
      ],
    );
  }

  Widget _buildActiveTaskCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.black12.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _columnMetric('Rooms', 'A-205'),
              _columnMetric('Cleaning Type', 'Full Clean'),
              _columnMetric('Task Time', '25:54'),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(child: _actionButtonOutline('Pause', () {})),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D2D3A),
                    minimumSize: Size(0, 48.h),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  ),
                  child: TextView('Complete', style: myTextStyle.font_14w600.copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGuestRequestCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.black12.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _columnMetric('Room', 'A-105'),
              SizedBox(width: 40.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView('Request', style: myTextStyle.font_12w400.copyWith(color: Colors.grey)),
                    SizedBox(height: 4.h),
                    RichText(
                      text: TextSpan(
                        style: myTextStyle.font_13w700.copyWith(color: Colors.black),
                        children: [
                          const TextSpan(text: 'Need Towel – '),
                          TextSpan(
                            text: '10 mins ago',
                            style: myTextStyle.font_12w400.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          _actionButton('Mark Delivered', Colors.black, () {}),
        ],
      ),
    );
  }

  // ================= 🔹 REUSABLE UTILS 🔹 =================

  Widget _statCardWide(String title, String value, String status) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.black12.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(title, style: myTextStyle.font_12w400.copyWith(color: Colors.grey)),
              TextView(value, style: myTextStyle.font_32w700),
            ],
          ),
          TextView(status, style: myTextStyle.font_13w700),
        ],
      ),
    );
  }

  Widget _statCardSmall(String title, String value) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.black12.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(title, style: myTextStyle.font_12w400.copyWith(color: Colors.grey)),
          SizedBox(height: 4.h),
          TextView(value, style: myTextStyle.font_30w700),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return TextView(title, style: myTextStyle.font_13w700);
  }

  Widget _sectionSubtitle(String title) {
    return TextView(title, style: myTextStyle.font_13w700.copyWith(color: Colors.black87));
  }

  Widget _infoCard(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.campaign_outlined, color: Colors.grey, size: 20),
          SizedBox(width: 10.w),
          Expanded(child: TextView(text, style: myTextStyle.font_12w400.copyWith(color: Colors.black54))),
          const Icon(Icons.close, color: Colors.grey, size: 16),
        ],
      ),
    );
  }

  Widget _dateChip(String date) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, size: 12, color: Colors.grey),
          SizedBox(width: 5.w),
          TextView(date, style: myTextStyle.font_10w400),
        ],
      ),
    );
  }

  Widget _columnMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(label, style: myTextStyle.font_12w400.copyWith(color: Colors.grey)),
        SizedBox(height: 4.h),
        TextView(value, style: myTextStyle.font_13w700),
      ],
    );
  }

  Widget _statusBadge(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6.r)),
      child: TextView(label, style: myTextStyle.font_12w500.copyWith(color: Colors.white)),
    );
  }

  Widget _timeMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(label, style: myTextStyle.font_10w400.copyWith(color: Colors.grey)),
        TextView(value, style: myTextStyle.font_30w700),
      ],
    );
  }

  Widget _timeMetricSmall(String label, String value) {
    return Column(
      children: [
        TextView(label, style: myTextStyle.font_12w700),
        TextView(value, style: myTextStyle.font_12w400.copyWith(color: Colors.grey)),
      ],
    );
  }

  Widget _actionButton(String label, Color color, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
        child: TextView(label, style: myTextStyle.font_14w600.copyWith(color: color)),
      ),
    );
  }

  Widget _actionButtonOutline(String label, VoidCallback onTap, {bool isDanger = false}) {
    return SizedBox(
      height: 48.h,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
        child: TextView(label, style: myTextStyle.font_14w600.copyWith(color: isDanger ? Colors.red : Colors.black)),
      ),
    );
  }
}