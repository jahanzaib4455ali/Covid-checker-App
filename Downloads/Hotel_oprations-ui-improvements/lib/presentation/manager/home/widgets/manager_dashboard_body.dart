import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/widget/text_view.dart';
import '../../../../theme/my_colors.dart';
import '../../../../theme/my_text_styles.dart';

class ManagerDashboardBody extends StatelessWidget {
  const ManagerDashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),

          // 1. Broadcast Banner
          _buildInfoBanner(
            title: "Today Important Broadcast",
            description: "Lorem ipsum dolor sit amet, consect adipi\nsing elit. Sed id enim semper vulputate.",
            iconPath: "assets/icons/Frame.svg",
          ),

          SizedBox(height: 12.h),

          // 2. Alert Banner
          _buildAlertBanner(
            title: "Room Not Cleaned on Time",
            description: "Room number A-101 housekeeping delay.",
            buttonText: "Reassign",
          ),

          SizedBox(height: 24.h),

          // 3. Header Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Welcome to dashboard!",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 17.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                _buildDateChip("22-02-2023"),
              ],
            ),
          ),

          SizedBox(height: 16.h),

          // 4. Department Dropdown
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text(
                  "Housekeeping",
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, size: 24.sp),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Divider(color: Colors.grey[200], thickness: 1, height: 1),
          SizedBox(height: 24.h),

          _buildSectionTitle("Rooms Status"),

          // 5. Room Status Grid (KPIs)
          _buildKPIGrid([
            _StatItem(title: "Total Rooms", value: "205"),
            _StatItem(title: "Out Of Service", value: "05"),
            _StatItem(title: "Occupied", value: "88"),
            _StatItem(title: "Vacant", value: "50"),
            _StatItem(title: "Ready Rooms", value: "18"),
            _StatItem(title: "Under Cleaning", value: "34"),
          ]),

          SizedBox(height: 24.h),
          Divider(color: Colors.grey[200], thickness: 1, height: 1),
          SizedBox(height: 24.h),

          // 6. Task Summary Card
          _buildSummaryCard(
              title: "Task Summary",
              mainMetric: _Metric(label: "Average Task Completion Time", value: "10:01", status: "Good"),
              subStats: [
                _StatItem(title: "Total Tasks", value: "34"),
                _StatItem(title: "Task Accepted", value: "29"),
              ]
          ),

          SizedBox(height: 28.h),
          Divider(color: Colors.grey[200], thickness: 1, height: 1),
          SizedBox(height: 28.h),

          // 7. Staff Performance Card
          _buildSummaryCard(
            title: "Staff Performance Overview",
            mainMetric: _Metric(label: "Average Cleaning Time", value: "10:01", status: "Good"),
            subStats: [
              _StatItem(title: "Total Staff", value: "110"),
              _StatItem(title: "On Time Arrival", value: "92%"),
              _StatItem(title: "Present Staff", value: "98"),
              _StatItem(title: "Absent Staff", value: "12"),
            ],
          ),

          SizedBox(height: 24.h),
          Divider(color: Colors.grey[200], thickness: 1, height: 1),
          SizedBox(height: 28.h),

          // 8. Live Room Status
          _buildSectionTitle("Live Room Status"),
          _buildFilterTabs(['All', 'Floor 1', 'Floor 2', 'Floor 3']),
          _buildActivityList(),

          SizedBox(height: 15.h),
          Divider(color: Colors.grey[200], thickness: 1, height: 1),
          SizedBox(height: 24.h),

          // 9. Feedback Section
          _buildListHeader("Feedback", "See all"),
          _buildFeedbackList(),

          SizedBox(height: 24.h),
          // --- STAFF TRACKER DIVIDER ADDED HERE ---
          Divider(color: Colors.grey[200], thickness: 1.5, height: 1),
          SizedBox(height: 24.h),

          // 10. Staff Tracker
          _buildListHeader("Staff Tracker", null),
          _buildStaffTrackerList(),

          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  // --- UI Component Helper Methods ---

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildInfoBanner({required String title, required String description, required String iconPath}) {
    return Column(
      children: [
        Divider(color: Colors.grey[200], thickness: 1, height: 1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(iconPath, width: 34.w, height: 32.h),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          title,
                          style: myTextStyle.font_13w700.copyWith(
                            color: MyColors.primaryDark1D1929,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                          child: Icon(Icons.close, size: 25.sp, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: TextView(
                  description,
                  style: myTextStyle.font_14w400.copyWith(
                    color: Colors.blueGrey[400],
                    fontSize: 16.sp,
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

  Widget _buildAlertBanner({required String title, required String description, required String buttonText}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/icons/Layer_1.svg", width: 34.w, height: 32.h, fit: BoxFit.contain),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          title,
                          style: myTextStyle.font_13w700.copyWith(
                            color: MyColors.primaryDark1D1929,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                          child: Icon(Icons.close, size: 25.sp, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: TextView(
                  description,
                  style: myTextStyle.font_14w400.copyWith(color: Colors.blueGrey[400], fontSize: 16.sp),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                  ),
                  child: Text(buttonText, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16.sp)),
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey[200], thickness: 1, height: 1),
      ],
    );
  }

  Widget _buildDateChip(String date) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/calendar.svg", width: 19.w, height: 19.h),
          SizedBox(width: 10.w),
          TextView(
            date,
            style: myTextStyle.font_16ww600.copyWith(color: MyColors.dark000000, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _buildKPIGrid(List<_StatItem> items) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey[100]!),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5, offset: const Offset(0, 2))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(items[index].title, style: TextStyle(color: Colors.grey[500], fontSize: 18.sp)),
                SizedBox(height: 4.h),
                Text(items[index].value, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummaryCard({required String title, required _Metric mainMetric, required List<_StatItem> subStats}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            title,
            style: TextStyle(fontFamily: 'Plus Jakarta Sans', fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey[100]!),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5, offset: const Offset(0, 2))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mainMetric.label, style: TextStyle(color: Colors.grey[500], fontSize: 16.sp)),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(mainMetric.value, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600)),
                  if (mainMetric.status != null)
                    Text(mainMetric.status!, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.6,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
            ),
            itemCount: subStats.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.grey[100]!),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5, offset: const Offset(0, 2))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(subStats[index].title, style: TextStyle(color: Colors.grey[500], fontSize: 18.sp)),
                    SizedBox(height: 4.h),
                    Text(subStats[index].value, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterTabs(List<String> filters) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        children: filters.map((f) => Container(
          width: 90.73.w,
          height: 50.49.h,
          margin: EdgeInsets.only(right: 8.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: f == 'All' ? const Color(0xFF1D1929) : Colors.grey[100],
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Text(
            f,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              color: f == 'All' ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        )).toList(),
      ),
    );
  }

  // --- UPDATED LIVE ROOM STATUS (Matches Screenshot) ---
  Widget _buildActivityList() {
    final list = [
      {'room': '101', 'status': 'Cleaned', 'staff': 'Amelia', 'time': '10:30 AM', 'icon': Icons.check_circle_outlined},
      {'room': '102', 'status': 'In Progress', 'staff': 'Ethan', 'time': '10:30 AM', 'icon': Icons.access_time},
      {'room': '103', 'status': 'Ready for Inspection', 'staff': 'Olivia', 'time': '10:30 AM', 'icon': Icons.close_outlined},
      {'room': '104', 'status': 'Maintenance', 'staff': 'Noah', 'time': '10:30 AM', 'icon': Icons.build_outlined},
    ];

    return Column(
      children: list.map((item) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5), // Professional thin border
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon Container (Taller Background)
              Container(
                width: 58.w,
                height: 72.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9), // Light grey background
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(item['icon'] as IconData, size: 28.sp, color: const Color(0xFF475569)),
              ),
              SizedBox(width: 18.w),
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Room ${item['room']} - ${item['status']}",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w800, // Very Bold
                        fontSize: 18.sp, // Bigger Text
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Assigned to ${item['staff']}",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: const Color(0xFF64748B),
                        fontSize: 15.sp, // Professional subtitle size
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Time
              Text(
                item['time']?.toString() ?? "",
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  color: const Color(0xFF64748B),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildListHeader(String title, String? trailing) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w800, fontSize: 22.sp)),
          if (trailing != null)
            Text(trailing, style: TextStyle(fontFamily: 'Plus Jakarta Sans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w700, decoration: TextDecoration.underline)),
        ],
      ),
    );
  }

  // --- UPDATED FEEDBACK (Matches Styling) ---
  Widget _buildFeedbackList() {
    final feedbackData = [
      {'title': "Guest Complain: Room not cleaned", 'subtitle': "Room A-202"},
      {'title': "AC not working properly", 'subtitle': "Room B-105"},
    ];

    return Column(
      children: feedbackData.map((item) => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 58.w,
              height: 72.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.access_time, size: 28.sp, color: const Color(0xFF475569)),
            ),
            SizedBox(width: 18.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title']!,
                    style: TextStyle(fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w800, fontSize: 18.sp, color: const Color(0xFF0F172A)),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    item['subtitle']!,
                    style: TextStyle(fontFamily: 'Plus Jakarta Sans', color: const Color(0xFF64748B), fontSize: 15.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }

  // --- UPDATED STAFF TRACKER (Matches Styling) ---
  Widget _buildStaffTrackerList() {
    final staffData = [
      {'name': "Amelia", 'info': "Task: 3/5 | Room: 102", 'initial': "A"},
      {'name': "Ethan", 'info': "Task: 2/5 | Room: 105", 'initial': "E"},
      {'name': "Olivia", 'info': "Task: 4/5 | Room: 201", 'initial': "O"},
      {'name': "Noah", 'info': "Task: 1/5 | Room: 108", 'initial': "N"},
    ];

    return Column(
      children: staffData.map((item) => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
        ),
        child: Row(
          children: [
            // --- UPDATED TO CIRCLE ---
            Container(
              width: 55.w, // Circle ke liye width aur height barabar rakhein
              height: 55.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                shape: BoxShape.circle, // Yeh line background ko circle bana degi
              ),
              alignment: Alignment.center,
              child: Text(
                item['initial']!,
                style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w800,
                    fontSize: 20.sp,
                    color: const Color(0xFF475569)
                ),
              ),
            ),
            SizedBox(width: 18.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name']!,
                    style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w800,
                        fontSize: 18.sp,
                        color: const Color(0xFF0F172A)
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item['info']!,
                    style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: const Color(0xFF64748B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: const Color(0xFF94A3B8)),
          ],
        ),
      )).toList(),
    );
  }
}

class _StatItem {
  final String title;
  final String value;
  _StatItem({required this.title, required this.value});
}

class _Metric {
  final String label;
  final String value;
  final String? status;
  _Metric({required this.label, required this.value, this.status});
}