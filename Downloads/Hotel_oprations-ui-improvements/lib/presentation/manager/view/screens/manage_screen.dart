import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/src_general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/presentation/manager/view/screens/reminder_list_screen.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';


import 'alert_list_screen.dart';
import 'employee_summary_screen.dart';
import 'my_task_screen.dart';
import 'revenue_report_screen.dart';

class ManageScreen extends StatelessWidget {
  const ManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SrcGeneralScaffold(
      backgroundColor: MyColors.whiteFFFFFF,
      isBackButton: false,
      showAppBar: false,
      isScrollable: false, // Set to false so we can control scrolling manually
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: TextView(
              "Management",
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 10.h),
                  _buildManageItem(
                    context,
                    title: "Tasks",
                    description: "Manage and complete assigned duties efficiently.",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyTaskScreen()),
                      );
                    },
                  ),
                  _buildManageItem(
                    context,
                    title: "Alert",
                    description: "Send important announcements or alerts to all staff instantly.",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AlertListScreen()),
                      );
                    },
                  ),
                  _buildManageItem(
                    context,
                    title: "Reminder",
                    description: "Set notifications for upcoming events, tasks or follow-ups.",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ReminderListScreen()),
                      );
                    },
                  ),
                  _buildManageItem(
                    context,
                    title: "Employee Summary",
                    description: "View each employee's overall performance, attendance, and task activity summary.",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EmployeeSummaryScreen()),
                      );
                    },
                  ),
                  _buildManageItem(
                    context,
                    title: "Reports",
                    description: "View key business metrics, financial summaries, and operational reports.",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RevenueReportScreen()),
                      );
                    },
                  ),
                  _buildManageItem(
                    context,
                    title: "Shift Management",
                    description: "Organize staff work hours, assign shifts, and ensure proper duty coverage.",
                    onTap: () {},
                  ),
                  _buildManageItem(
                    context,
                    title: "Roaster Management",
                    description: "Create and manage staff duty schedules to ensure proper shift coverage and workload balance.",
                    onTap: () {},
                  ),
                  _buildManageItem(
                    context,
                    title: "Approval Request",
                    description: "Review and approve pending requests such as leaves, tasks, or exceptions.",
                    onTap: () {},
                  ),
                  _buildManageItem(
                    context,
                    title: "Access Request",
                    description: "Review or approve request to gain necessary access or authorization",
                    onTap: () {},
                  ),
                  _buildManageItem(
                    context,
                    title: "Guest Review",
                    description: "View and manage feedback or ratings shared by guests",
                    showDivider: false,
                    onTap: () {},
                  ),
                  
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildManageItem(
    BuildContext context, {
    required String title,
    required String description,
    VoidCallback? onTap,
    bool showDivider = true,
  }) {
    return InkWell(
      onTap: onTap ?? () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: TextView("$title screen coming soon", style: const TextStyle(color: Colors.white))),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          TextView(
            title,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 6.h),
          TextView(
            description,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF64748B),
            ),
          ),
          SizedBox(height: 16.h),
          if (showDivider)
            const Divider(color: Color(0xFFE4E7EC), thickness: 1),
        ],
      ),
    );
  }
}
