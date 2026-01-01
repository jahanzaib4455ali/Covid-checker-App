import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/src_general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/presentation/manager/tasks/view/unified_task_screen.dart';

import '../../view/screens/access_list_screen.dart';
import '../../view/screens/alert_list_screen.dart';
import '../../view/screens/approval_list_screen.dart';
import '../../view/screens/employee_summary_screen.dart';
import '../../view/screens/guest_review_screen.dart';
import '../../view/screens/reminder_list_screen.dart';
import '../../view/screens/roaster_list_screen.dart';
import '../../view/screens/shift_list_screen.dart';

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
                fontSize: 30.sp,
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
                        MaterialPageRoute(builder: (context) => const UnifiedTaskScreen()),
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
                    title: "Shift Management",
                    description: "Organize staff work hours, assign shifts, and ensure proper duty coverage.",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ShiftListScreen()),
                      );
                    },
                  ),
                  _buildManageItem(
                    context,
                    title: "Roaster Management",
                    description: "Create and manage staff duty schedules to ensure proper shift coverage and workload balance.",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RoasterListScreen()),
                      );
                    },
                  ),
                  _buildManageItem(
                    context,
                    title: "Approval Request",
                    description: "Review and approve pending requests such as leaves, tasks, or exceptions.",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ApprovalListScreen()),
                      );
                    },
                  ),
                  _buildManageItem(
                    context,
                    title: "Access Request",
                    description: "Review or approve request to gain necessary access or authorization",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AccessListScreen()),
                      );
                    },
                  ),
                  _buildManageItem(
                    context,
                    title: "Guest Review",
                    description: "View and manage feedback or ratings shared by guests",
                    showDivider: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GuestReviewScreen()),
                      );
                    },
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
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4.h),
          TextView(
            description,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF667085),
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
