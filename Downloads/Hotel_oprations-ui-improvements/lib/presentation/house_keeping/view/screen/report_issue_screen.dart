import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/src_general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class ReportIssueScreen extends StatefulWidget {
  const ReportIssueScreen({super.key});

  @override
  State<ReportIssueScreen> createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  String selectedRoomNo = "A-101";
  String selectedRoomAssets = "Electronics";
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SrcGeneralScaffold(
      isBackButton: false,
      showAppBar: false,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Header with back button
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      child: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  TextView(
                    "Issue Report",
                    style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 30.h),
            
            // Select Room No
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    "Select Room No",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  SizedBox(height: 12.h),
                  _buildDropdownField(selectedRoomNo, ["A-101", "A-102", "A-103"]),
                ],
              ),
            ),
            
            SizedBox(height: 24.h),
            
            // Select Room Assets
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    "Select Room Assets",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  SizedBox(height: 12.h),
                  _buildDropdownField(selectedRoomAssets, ["Electronics", "Furniture", "Bathroom", "Other"]),
                ],
              ),
            ),
            
            SizedBox(height: 24.h),
            
            // Write or Record Issue
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    "Write or Record Issue",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.mic, color: Colors.white, size: 16.sp),
                        SizedBox(width: 4.w),
                        TextView(
                          "Voice",
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 12.h),
            
            // Text Area
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 200.h,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextField(
                  controller: _noteController,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: "Write Note........",
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade400,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            
            SizedBox(height: 40.h),
            
            // Report Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: () => _showConfirmation(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D1929),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  ),
                  child: TextView(
                    "Report",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 100.h), // Bottom spacing
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(String value, List<String> items) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
            value,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: 24.sp),
        ],
      ),
    );
  }

  void _showConfirmation() {
    // Simple confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: TextView("Confirmation", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
        content: TextView("Are you sure you want to submit the issue report?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: TextView("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1D1929)),
            child: TextView("Confirm", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
