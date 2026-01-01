import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

class CreateNewTaskScreen extends StatefulWidget {
  const CreateNewTaskScreen({super.key});

  @override
  State<CreateNewTaskScreen> createState() => _CreateNewTaskScreenState();
}

class _CreateNewTaskScreenState extends State<CreateNewTaskScreen> {
  String selectedDepartment = 'Housekeeping';
  String selectedEmployee = 'Rizwan 0001 / Open to All';
  String selectedTask = 'Room Dusting Only';

  final TextEditingController taskDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteFFFFFF,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: MyColors.grayF5F5F5,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        size: 20.w,
                        color: MyColors.dark000000,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    'Create New Task',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: MyColors.dark000000,
                    ),
                  ),
                ],
              ),
            ),
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(20.w, 32.h, 20.w, 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Select Employee
                    _buildSectionTitle('Select Employee'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      value: selectedEmployee,
                      onChanged: (value) => setState(() => selectedEmployee = value!),
                      items: ['Rizwan 0001 / Open to All', 'Haris Khan', 'Ahmed Ali', 'Sara Khan'],
                    ),
                    
                    SizedBox(height: 24.h),

                    // Select Department
                    _buildSectionTitle('Select Department'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      value: selectedDepartment,
                      onChanged: (value) => setState(() => selectedDepartment = value!),
                      items: ['Housekeeping', 'Front Desk', 'Maintenance', 'Food Service'],
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    // Select Task
                    _buildSectionTitle('Select Task'),
                    SizedBox(height: 8.h),
                    _buildDropdownField(
                      value: selectedTask,
                      onChanged: (value) => setState(() => selectedTask = value!),
                      items: ['Room Dusting Only', 'Deep Cleaning', 'Technical Maintenance', 'Laundry Pickup'],
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    // Task Description
                    _buildSectionTitle('Description'),
                    SizedBox(height: 8.h),
                    Container(
                      width: double.infinity,
                      height: 120.h,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: MyColors.whiteFFFFFF,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: MyColors.grayD0D5DD.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: taskDescriptionController,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Description',
                          hintStyle: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: MyColors.gray667085,
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.dark000000,
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 40.h),
                    
                    // Create Button
                    Container(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.dark000000,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Create',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: MyColors.dark000000,
      ),
    );
  }

  Widget _buildDropdownField({
    required String value,
    required Function(String?) onChanged,
    required List<String> items,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: MyColors.grayD0D5DD.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: MyColors.gray667085,
            size: 20.w,
          ),
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: MyColors.gray667085,
          ),
          items: items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  @override
  void dispose() {
    taskDescriptionController.dispose();
    super.dispose();
  }
}
