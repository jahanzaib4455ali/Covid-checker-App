import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class CreateRoasterScreen extends StatefulWidget {
  const CreateRoasterScreen({super.key});

  @override
  State<CreateRoasterScreen> createState() => _CreateRoasterScreenState();
}

class _CreateRoasterScreenState extends State<CreateRoasterScreen> {
  String selectedEmployee = "Select Employee";
  String selectedDepartment = "Select Department";
  String selectedDuties = "Select Duties";
  String startDate = "15-01-2025";
  String endDate = "21-01-2025";
  List<String> selectedDays = [];
  
  final List<String> weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

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
          "Create Roaster",
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
              "Duties",
              selectedDuties,
              ["Room Cleaning", "Food Preparation", "Security Patrol", "Guest Service"],
              (value) => setState(() => selectedDuties = value!),
            ),
            
            SizedBox(height: 20.h),
            
            _buildDateField("Start Date", startDate, () => _selectDate(true)),
            
            SizedBox(height: 20.h),
            
            _buildDateField("End Date", endDate, () => _selectDate(false)),
            
            SizedBox(height: 20.h),
            
            TextView(
              "Working Days",
              style: myTextStyle.font_14w600.copyWith(color: MyColors.dark000000),
            ),
            SizedBox(height: 8.h),
            
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: MyColors.whiteFFFFFF,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: MyColors.grayD0D5DD),
              ),
              child: Column(
                children: weekDays.map((day) => CheckboxListTile(
                  title: TextView(day, style: myTextStyle.font_14w500),
                  value: selectedDays.contains(day),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        selectedDays.add(day);
                      } else {
                        selectedDays.remove(day);
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                )).toList(),
              ),
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
                  "Create Roaster",
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

  Widget _buildDateField(String label, String value, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(label, style: myTextStyle.font_14w600.copyWith(color: MyColors.dark000000)),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: MyColors.whiteFFFFFF,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: MyColors.grayD0D5DD),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(value, style: myTextStyle.font_14w500.copyWith(color: MyColors.dark000000)),
                const Icon(Icons.calendar_today, color: MyColors.gray9F9F9F, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _selectDate(bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        final formattedDate = "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
        if (isStartDate) {
          startDate = formattedDate;
        } else {
          endDate = formattedDate;
        }
      });
    }
  }
}