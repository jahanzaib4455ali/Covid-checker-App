import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';


class CreateAlertScreen extends StatefulWidget {
  const CreateAlertScreen({super.key});

  @override
  State<CreateAlertScreen> createState() => _CreateAlertScreenState();
}

class _CreateAlertScreenState extends State<CreateAlertScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  
  String selectedRecipient = 'Rahul Kumar';
  String selectedDepartment = 'Select';
  String selectedPriority = 'Urgent/Normal';
  bool isVoiceMessage = false;

  @override
  void initState() {
    super.initState();
    titleController.text = 'Room A-102 needs towel';
  }

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
              CustomBackButton(onPressed: () => Navigator.pop(context)),
                  SizedBox(width: 16.w),
                  TextView(
                    'Alert',
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
                      hintText: 'Room A-102 needs towel',
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    // Select Recipient
                    CommonDropdownField(
                      labelText: 'Select Recipient',
                      value: selectedRecipient,
                      items: ['Rahul Kumar', 'Sarah Khan', 'Ahmed Ali', 'Maria Santos'],
                      onChanged: (value) => setState(() => selectedRecipient = value!),
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    // Department/Individual
                    CommonSearchField(
                      labelText: 'Department/Individual',
                      value: selectedDepartment,
                      hintText: 'Select',
                      onTap: () {
                        // TODO: Show department selection
                      },
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    // Priority
                    CommonDropdownField(
                      labelText: 'Priority',
                      value: selectedPriority,
                      items: ['Urgent/Normal', 'High', 'Medium', 'Low', 'Urgent'],
                      onChanged: (value) => setState(() => selectedPriority = value!),
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    // Message (Optional)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Message (Optional)',
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

            // Send Notification Button
            Padding(
              padding: EdgeInsets.all(20.w),
              child: CommonButton(
                text: 'Send Notification',
                onPressed: () {
                  // TODO: Implement send notification
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Notification sent successfully!'),
                    ),
                  );
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


  @override
  void dispose() {
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }
}