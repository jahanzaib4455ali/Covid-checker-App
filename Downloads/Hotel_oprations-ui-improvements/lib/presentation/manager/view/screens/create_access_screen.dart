import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class CreateAccessScreen extends StatefulWidget {
  const CreateAccessScreen({super.key});

  @override
  State<CreateAccessScreen> createState() => _CreateAccessScreenState();
}

class _CreateAccessScreenState extends State<CreateAccessScreen> {
  String selectedEmployee = "Select Employee";
  String selectedDepartment = "Select Department";
  String selectedAccessType = "System Access";
  String requestedAccess = "Enter Access Details";
  String reason = "Enter Reason";

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
          "Grant Access",
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
              "Department",
              selectedDepartment,
              ["Housekeeping", "Kitchen", "Security", "Reception"],
              (value) => setState(() => selectedDepartment = value!),
            ),
            
            SizedBox(height: 20.h),
            
            _buildDropdownField(
              "Access Type",
              selectedAccessType,
              ["System Access", "Area Access", "Admin Access", "Module Access"],
              (value) => setState(() => selectedAccessType = value!),
            ),
            
            SizedBox(height: 20.h),
            
            _buildTextField(
              "Requested Access",
              requestedAccess,
              (value) => setState(() => requestedAccess = value),
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
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryDark1D1929,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: TextView(
                  "Grant Access",
                  style: myTextStyle.font_16ww700.copyWith(color: MyColors.whiteFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
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
}