import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';

class CreateReminderScreen extends StatefulWidget {
  const CreateReminderScreen({super.key});

  @override
  State<CreateReminderScreen> createState() => _CreateReminderScreenState();
}

class _CreateReminderScreenState extends State<CreateReminderScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  
  String selectedStaff = 'Select List';
  bool isVoiceMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteFFFFFF,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with back button and title
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
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
                  TextView(
                    'Reminder',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: MyColors.dark000000,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),

            // Form content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    CommonTextField(
                      controller: titleController,
                      labelText: 'Title',
                      hintText: 'Enter Title',
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    // Select Staff
                    CommonSearchField(
                      labelText: 'Select Staff',
                      value: selectedStaff,
                      hintText: 'Select List',
                      onTap: () {
                        // TODO: Show staff selection dialog
                        _showStaffSelection();
                      },
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    // Message with Voice button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Message',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: MyColors.dark000000,
                          ),
                        ),
                        VoiceButton(
                          isActive: isVoiceMessage,
                          onPressed: () {
                            setState(() {
                              isVoiceMessage = !isVoiceMessage;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    CommonTextField(
                      controller: messageController,
                      hintText: 'Write here',
                      maxLines: 5,
                    ),
                    
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),

            // Submit Button
            Padding(
              padding: EdgeInsets.all(20.w),
              child: CommonButton(
                text: 'Submit',
                onPressed: () {
                  // TODO: Implement submit reminder
                  _handleSubmit();
                },
                type: ButtonType.primary,
                size: ButtonSize.large,
                isFullWidth: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showStaffSelection() {
    // Sample staff list
    final List<String> staffList = [
      'All Departments',
      'Kitchen Staff',
      'Housekeeping Team',
      'Front Desk Team',
      'Maintenance Team',
      'Security Team',
      'Management Team',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: MyColors.whiteFFFFFF,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: EdgeInsets.only(top: 12.h, bottom: 20.h),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: MyColors.grayD0D5DD,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              
              // Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text(
                      'Select Staff',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.dark000000,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        size: 24.w,
                        color: MyColors.gray667085,
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 20.h),
              
              // Staff list
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: staffList.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 1.h,
                    color: MyColors.grayD0D5DD.withOpacity(0.3),
                  ),
                  itemBuilder: (context, index) {
                    final staff = staffList[index];
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                      title: Text(
                        staff,
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.dark000000,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedStaff = staff;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
              
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }

  void _handleSubmit() {
    if (titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter a title',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
      return;
    }

    if (selectedStaff == 'Select List') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please select staff',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
      return;
    }

    // Show success message and go back
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Reminder created successfully!',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: MyColors.dark000000,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }
}