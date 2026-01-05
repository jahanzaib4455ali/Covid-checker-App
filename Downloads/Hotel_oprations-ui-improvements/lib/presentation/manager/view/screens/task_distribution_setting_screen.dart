import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/common_blur_modal.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/presentation/manager/view/screens/my_task_screen.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class TaskDistributionSettingScreen extends StatefulWidget {
  const TaskDistributionSettingScreen({super.key});

  @override
  State<TaskDistributionSettingScreen> createState() => _TaskDistributionSettingScreenState();
}

class _TaskDistributionSettingScreenState extends State<TaskDistributionSettingScreen> {
  bool autoAssignUnaccepted = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextView(
          "Task Distribution Setting",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            
            // Auto Assign Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  "Auto Assign Unaccepted Task",
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: const Color(0xFF344054)),
                ),
                _buildCustomSwitch(autoAssignUnaccepted, (val) {
                  setState(() => autoAssignUnaccepted = val);
                }),
              ],
            ),

            _buildLabel("Auto-assignment Threshold"),
            _buildDropdown("5 Minute"),

            _buildLabel("Distribution Type"),
            _buildDropdown("Equal Distribution (Round Robin)"),

            _buildLabel("Auto-Assign Distribution Queue"),
            _buildDropdown("Lowest Task Count / Longest Idle Time"),

            const Spacer(),
            
            // Final Create Button
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () {
                   _showConfirmationBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B2838),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                ),
                child: TextView(
                  "Create",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  // --- Wahi Custom Switch jo aapne set kiya tha (71x30) ---
  // --- Updated Custom Switch with your exact Dimensions ---
  Widget _buildCustomSwitch(bool value, Function(bool) onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 71.w,  // As per your requirement
        height: 45.h, // As per your requirement
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: value ? const Color(0xFF1D1929) : Colors.white,
          border: Border.all(
            color: const Color(0xFFD0D5DD),
            width: 1.0, // Border width 1px
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ON/OFF Text Layer
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: value ? Alignment.centerLeft : Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  value ? "ON" : "OFF",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: value ? Colors.white : const Color(0xFF667085),
                  ),
                ),
              ),
            ),
            // Moving Circle (Thumb)
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 22.w,
                height: 22.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: value ? Colors.white : const Color(0xFF98A2B3),
                    boxShadow: [
                      if(!value) BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))
                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 8.h),
      child: TextView(
        text,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: const Color(0xFF344054)),
      ),
    );
  }

  Widget _buildDropdown(String hint) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        border: Border.all(color: const Color(0xFFD0D5DD)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: TextView(hint, style: TextStyle(fontSize: 14.sp, color: const Color(0xFF667085))),
          items: [],
          onChanged: (value) {},
          icon: Icon(Icons.keyboard_arrow_down, color: const Color(0xFF667085)),
        ),
      ),
    );
  }




  void _showConfirmationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CommonBlurModal(
          child: Container(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16.h),
                
                // Title
                TextView(
                  "Confirm Task Creation",
                  style: myTextStyle.font_20wMedium.copyWith(
                    fontSize: 22.h,
                    fontWeight: FontWeight.w700,
                    color: MyColors.primaryDark1D1929,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 12.h),
                
                // Subtitle
                TextView(
                  "Please review the task details before creation",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 14.h,
                    color: MyColors.gray6E7C87,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 24.h),
                
                // Details Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: MyColors.grayF7F7F8,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: MyColors.grayE5E5E5, width: 1),
                  ),
                  child: Column(
                    children: [
                      _buildSummaryRow("Assigned To", "Rizwan 0001"),
                      Divider(height: 24.h, color: MyColors.grayE5E5E5),
                      _buildSummaryRow("Location", "Room A-102"),
                      Divider(height: 24.h, color: MyColors.grayE5E5E5),
                      _buildSummaryRow("Start Time", "Now (11:00 AM)"),
                    ],
                  ),
                ),
                
                SizedBox(height: 32.h),
                
                // Confirm Button
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MyTaskScreen()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primaryDark1D1929,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                    child: TextView(
                      "Confirm & Create",
                      style: myTextStyle.font_16ww500.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(label, style: myTextStyle.font_14w400.copyWith(color: MyColors.gray6E7C87)),
        TextView(value, style: myTextStyle.font_14w500.copyWith(color: MyColors.primaryDark1D1929, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
