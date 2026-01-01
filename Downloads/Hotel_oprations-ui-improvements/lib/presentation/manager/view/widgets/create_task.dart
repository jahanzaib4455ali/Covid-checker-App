import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_loader_elevated_button.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/presentation/order_food/view/screens/food_menu.dart';


import '../../../../l10n/app_localizations.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  String selectedEmployee = 'Rahul Kumar';
  String selectedDepartment = 'Room Service';
  String selectedTask = 'Room Dusting Only';
  String description = '';

  final List<String> employees = ['Rahul Kumar', 'John Doe', 'Jane Smith'];
  final List<String> departments = ['Room Service', 'Cook', 'Housekeeping', 'Security'];
  final List<String> tasks = ['Room Dusting Only', 'Laundry', 'Check-in'];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return GeneralScaffold(
      isBackButton: false,
      isProfile: false,
      isScrollable: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            MyIcons.arrowRight,
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        TextView(
                          AppLocalizations.of(context)?.createTask ?? "CreateTask",
                          style: myTextStyle.font_16ww500.copyWith(
                            fontSize: 20.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              _buildDropdown(
                label: AppLocalizations.of(context)?.selectEmployee ?? "SelectEmployee",
                value: selectedEmployee,
                items: employees,
                onChanged: (value) {
                  setState(() {
                    selectedEmployee = value!;
                  });
                },
              ),
              SizedBox(height: 20.h),
              _buildDropdown(
                label: AppLocalizations.of(context)?.selectDepartment ?? "Select Department",
                value: selectedDepartment,
                items: departments,
                onChanged: (value) {
                  setState(() {
                    selectedDepartment = value!;
                  });
                },
              ),
              SizedBox(height: 20.h),
              _buildDropdown(
                label: AppLocalizations.of(context)?.selectTask ?? "SelectTask",
                value: selectedTask,
                items: tasks,
                onChanged: (value) {
                  setState(() {
                    selectedTask = value!;
                  });
                },
              ),
              SizedBox(height: 20.h),
              TextView(
                AppLocalizations.of(context)?.description ??
                    "Description",
                style: myTextStyle.font_16ww500,
              ),
              SizedBox(height: 11.h),
              Container(
                padding: EdgeInsets.only(top: 13.h, left: 16.w, right: 17.w, bottom: 16.h),
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: MyColors.grayD0D5DD,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)?.roomDustingOnly ??
                        "RoomDustingOnly",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
              ),

              SizedBox(height: 50.h),
              MyLoaderElvButton(
                padding: const EdgeInsets.only(bottom: 100.0),
                borderRadius: 10,
                height: 55,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FoodMenuScreen()),
                  );
                },
                text: AppLocalizations.of(context)?.submit ??
                    "Submit",
                state: null,
                textStyle: myTextStyle.font_25wRegular.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.h,
                  color: MyColors.whiteFFFFFF,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          label,
          style: myTextStyle.font_16ww500,
        ),
        SizedBox(height: 11.h),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: MyColors.grayD0D5DD),
            ),
          ),
          dropdownColor: MyColors.whiteFFFFFF,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
