import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool isPunchedIn = false; // "Not Working" state by default

  @override
  Widget build(BuildContext context) {
    return SrcGeneralScaffold(
      isBackButton: false,
      isScrollable: true,
      physics: const BouncingScrollPhysics(),
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 1. TOP DIVIDER
          const Divider(thickness: 1, height: 1, color: Color(0xffEEEEEE)),

          /// 🔹 2. HEADER SECTION (Badge Divider ke niche se start hoga)
          _buildDynamicHeader(),

          /// 🔹 3. DIVIDER AFTER HEADER
          const Divider(thickness: 1, height: 1, color: Color(0xffEEEEEE)),

          /// 🔹 4. BROADCAST SECTION
          _buildBroadcastSection(),

          const Divider(thickness: 1, height: 1, color: Color(0xffEEEEEE)),

          /// 🔹 5. DASHBOARD CONTENT
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _sectionTitle('HK Dashboard'),
                    _dateChip('22-02-2023'),
                  ],
                ),
                TextView('Welcome to dashboard!',
                    style: TextStyle(fontSize: 17.sp, color: Colors.grey[600])),

                SizedBox(height: 16.h),
                _sectionSubtitle('Quick Summary Panel'),
                SizedBox(height: 12.h),
                _buildSummaryGrid(),

                SizedBox(height: 24.h),
                _sectionSubtitle('Task Summary'),
                SizedBox(height: 12.h),
                _buildTaskSummaryGrid(),

                if (isPunchedIn) ...[
                  SizedBox(height: 24.h),
                  const Divider(thickness: 1, color: Color(0xffEEEEEE)),
                  SizedBox(height: 16.h),
                  _sectionSubtitle('Active Task Display'),
                  SizedBox(height: 12.h),
                  _buildActiveTaskCard(),

                  SizedBox(height: 24.h),
                  const Divider(thickness: 1, color: Color(0xffEEEEEE)),
                  SizedBox(height: 16.h),
                  _sectionSubtitle('Guest Request Panel'),
                  SizedBox(height: 12.h),
                  _buildGuestRequestCard(),
                ],
              ],
            ),
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  // ================= 🔹 UPDATED HEADER FLOW 🔹 =================
  Widget _buildDynamicHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 0, bottom: 20.h, left: 16.w, right: 16.w),
      child: Column(
        children: [
          /// 🔹 STATUS BADGE (Top Center - Divider se touch ho raha hai)
          _statusBadgeSmall(
            isPunchedIn ? 'Currently Working' : 'Not Working',
            isPunchedIn ? const Color(0xff00A35E) : const Color(0xffC62828),
          ),
          SizedBox(height: 16.h),

          if (!isPunchedIn) ...[
            /// 🔴 NOT WORKING VIEW
            TextView('Next Shift Start in', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.grey[600])),
            TextView('00:00:00', style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _timeSubLabel('DD'), SizedBox(width: 25.w),
                _timeSubLabel('MM'), SizedBox(width: 25.w),
                _timeSubLabel('HH'),
              ],
            ),
            SizedBox(height: 20.h),
            _punchInButton(),
          ] else ...[
            /// 🟢 CURRENTLY WORKING VIEW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _timeMetric('Working Hours', '04:46'),
                TextView('Time Details',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, decoration: TextDecoration.underline, color: Colors.black)),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _timeMetricSmall('Request Delay', '01:45'),
                _timeMetricSmall('Break Time', '03:45'),
                _timeMetricSmall('Idle Time', '00:45'),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(child: _actionButtonOutline('Take a Break', () {})),
                SizedBox(width: 12.w),
                Expanded(
                  child: _actionButtonOutline(
                    'End Of Day',
                        () => setState(() => isPunchedIn = false),
                    isDanger: true,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  // 🔹 Badge UI (Flat Top to stick with divider)
  Widget _statusBadgeSmall(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
          topLeft: Radius.zero,
          topRight: Radius.zero,
        ),
      ),
      child: TextView(label, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white)),
    );
  }

  // ================= 🔹 COMPONENTS 🔹 =================

  Widget _buildBroadcastSection() {
    return Column(
      children: [
        Divider(color: Colors.grey[200], thickness: 1, height: 1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Same icon as manager dashboard
                  SvgPicture.asset(
                    "assets/icons/Frame.svg", // Using Frame icon like manager
                    width: 34.w, 
                    height: 32.h,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          'Today Important Broadcast',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1D1929),
                            height: 1.2,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[200], 
                            shape: BoxShape.circle
                          ),
                          child: Icon(Icons.close, size: 20.sp, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: TextView(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey[200], thickness: 1, height: 1),
      ],
    );
  }

  Widget _punchInButton() {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: OutlinedButton(
        onPressed: () => setState(() => isPunchedIn = true),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black26),
          backgroundColor: const Color(0xffF2F2F2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        child: TextView('Punch In', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
      ),
    );
  }

  Widget _buildSummaryGrid() {
    return Column(
      children: [
        _statCardWide('Average Response Time', '10:01', 'Good'),
        SizedBox(height: 12.h),
        Row(children: [
          Expanded(child: _statCardSmall('Task Accepted', '29')),
          SizedBox(width: 12.w),
          Expanded(child: _statCardSmall('Room Cleaned', '17')),
        ]),
        SizedBox(height: 12.h),
        Row(children: [
          Expanded(child: _statCardSmall('Guest Requests', '45')),
          SizedBox(width: 12.w),
          Expanded(child: _statCardSmall('Urgent Rooms', '06')),
        ]),
      ],
    );
  }

  Widget _buildTaskSummaryGrid() {
    return Column(
      children: [
        _statCardWide('Average Task Completion Time', '10:01', 'Good'),
        SizedBox(height: 12.h),
        Row(children: [
          Expanded(child: _statCardSmall('Total Task Accepted', '34')),
          SizedBox(width: 12.w),
          Expanded(child: _statCardSmall('Task Completed', '29')),
        ]),
      ],
    );
  }

  Widget _buildActiveTaskCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _columnMetric('Rooms', 'A-205'),
            _columnMetric('Cleaning Type', 'Full Clean'),
            _columnMetric('Task Time', '25:54'),
          ]),
          SizedBox(height: 16.h),
          Row(children: [
            Expanded(child: _actionButtonOutline('Pause', () {})),
            SizedBox(width: 12.w),
            Expanded(child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2D2D3A),
                minimumSize: Size(0, 45.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
              ),
              child: TextView('Complete', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white)),
            )),
          ]),
        ],
      ),
    );
  }

  Widget _buildGuestRequestCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        children: [
          Row(children: [
            _columnMetric('Room', 'A-105'),
            SizedBox(width: 30.w),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView('Request', style: myTextStyle.font_12w400.copyWith(color: Colors.grey)),
                RichText(text: TextSpan(
                  style: myTextStyle.font_13w700.copyWith(color: Colors.black),
                  children: [
                    const TextSpan(text: 'Need Towel – '),
                    TextSpan(text: '10 mins ago', style: myTextStyle.font_12w400.copyWith(color: Colors.grey)),
                  ],
                )),
              ],
            )),
          ]),
          SizedBox(height: 16.h),
          _actionButtonOutline('Mark Delivered', () {}),
        ],
      ),
    );
  }

  // --- Helpers ---
  Widget _statCardWide(String title, String value, String status) => Container(
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(8.r)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextView(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.grey[500])),
        TextView(value, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black)),
      ]),
      TextView(status, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black)),
    ]),
  );

  Widget _statCardSmall(String title, String value) => Container(
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(8.r)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextView(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.grey[500])),
      TextView(value, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black)),
    ]),
  );

  Widget _actionButtonOutline(String label, VoidCallback onTap, {bool isDanger = false}) => SizedBox(
    height: 45.h, width: double.infinity,
    child: OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
      child: TextView(label, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: isDanger ? Colors.red : Colors.black)),
    ),
  );

  Widget _timeSubLabel(String label) => TextView(label, style: myTextStyle.font_12w600.copyWith(color: Colors.grey));
  Widget _sectionTitle(String title) => TextView(title, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.black));
  Widget _sectionSubtitle(String title) => TextView(title, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black87));
  Widget _columnMetric(String label, String value) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    TextView(label, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.grey[500])),
    TextView(value, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.black)),
  ]);
  Widget _timeMetric(String label, String value) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    TextView(label, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.grey[500])),
    TextView(value, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black)),
  ]);
  Widget _timeMetricSmall(String label, String value) => Column(children: [
    TextView(label, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black)),
    TextView(value, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.grey[600])),
  ]);
  Widget _dateChip(String date) => Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
    decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(20.r)),
    child: Row(children: [const Icon(Icons.calendar_today, size: 16), SizedBox(width: 6.w), TextView(date, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black))]),
  );
}