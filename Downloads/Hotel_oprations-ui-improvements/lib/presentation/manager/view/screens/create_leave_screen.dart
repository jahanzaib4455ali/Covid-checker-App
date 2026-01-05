import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class CreateLeaveScreen extends StatefulWidget {
  const CreateLeaveScreen({super.key});

  @override
  State<CreateLeaveScreen> createState() => _CreateLeaveScreenState();
}

class _CreateLeaveScreenState extends State<CreateLeaveScreen> {
  String selectedEmployee = "Select Employee";
  String selectedLeaveType = "Sick Leave";
  String duration = "2 Days";
  String reason = "Medical Checkup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColors.whiteFFFFFF,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColors.dark000000),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextView(
          "Grant Leave",
          style: myTextStyle.font_18w600.copyWith(color: MyColors.dark000000),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdownField(
              "Select Employee",
              selectedEmployee,
              ["Ahmad Ali", "Sara Khan", "John Doe", "Aisha"],
              (value) => setState(() => selectedEmployee = value!),
            ),
            
            SizedBox(height: 20.h),
            
            _buildDropdownField(
              "Leave Type",
              selectedLeaveType,
              ["Sick Leave", "Casual Leave", "Annual Leave", "Unpaid Leave"],
              (value) => setState(() => selectedLeaveType = value!),
            ),
            
            SizedBox(height: 20.h),
            
             _buildTextField(
              "Duration (Days)",
              duration,
              (value) => setState(() => duration = value),
            ),
             SizedBox(height: 20.h),

            _buildTextField(
              "Reason",
              reason,
              (value) => setState(() => reason = value),
              maxLines: 3,
            ),
            
            SizedBox(height: 40.h),
            
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () => _showLeaveConfirmationSheet(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryDark1D1929,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: TextView(
                  "Approve Leave",
                  style: myTextStyle.font_16ww700.copyWith(color: MyColors.whiteFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLeaveConfirmationSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: TextView(
                  "Confirm Leave Approval",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              SizedBox(height: 20.h),
              _buildSummaryRow("Employee", selectedEmployee),
              _divider(),
              _buildSummaryRow("Leave Type", selectedLeaveType),
              _divider(),
              _buildSummaryRow("Duration", duration),
              _divider(),
              _buildSummaryRow("Key Impact", "45 Expected Guests"),
              
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 20.sp),
                    SizedBox(width: 8.w),
                    Expanded(child: TextView("Warning: High guest volume expected during this period.", style: TextStyle(fontSize: 12.sp, color: Colors.orange[800]))),
                  ],
                ),
              ),

              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close sheet
                    Navigator.pop(context); // Close screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D1929),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  ),
                  child: Text("Confirm Approval", style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDropdownField(String label, String value, List<String> items, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(label, style: myTextStyle.font_14w600.copyWith(color: MyColors.dark000000)),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: MyColors.whiteFFFFFF,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: MyColors.grayD0D5DD),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: items.contains(value) ? value : items.first,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down, color: MyColors.gray9F9F9F),
              items: items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: TextView(item, style: myTextStyle.font_14w500));
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String value, ValueChanged<String> onChanged, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(label, style: myTextStyle.font_14w600.copyWith(color: MyColors.dark000000)),
        SizedBox(height: 8.h),
        TextField(
          controller: TextEditingController(text: value),
          maxLines: maxLines,
          style: myTextStyle.font_14w500.copyWith(color: MyColors.dark000000),
          decoration: InputDecoration(
            hintText: value,
            hintStyle: myTextStyle.font_14w400.copyWith(color: MyColors.gray9F9F9F),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: MyColors.grayD0D5DD),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: MyColors.grayD0D5DD),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: MyColors.primaryDark1D1929),
            ),
            filled: true,
            fillColor: MyColors.whiteFFFFFF,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(label, style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
        TextView(value, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black)),
      ],
    );
  }

  Widget _divider() => Padding(padding: EdgeInsets.symmetric(vertical: 12.h), child: Divider(height: 1, color: MyColors.grayF4F4F6));
}
