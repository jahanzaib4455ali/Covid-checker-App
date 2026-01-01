import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

import '../../view/widgets/common_button.dart';
import '../../view/widgets/common_text_field.dart';


class CreateBroadcastScreen extends StatefulWidget {
  const CreateBroadcastScreen({super.key});

  @override
  State<CreateBroadcastScreen> createState() => _CreateBroadcastScreenState();
}

class _CreateBroadcastScreenState extends State<CreateBroadcastScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  
  String selectedDepartment = 'Kitchen';
  bool isVoiceMessage = false;

  @override
  void initState() {
    super.initState();
    dateTimeController.text = '20-06-2025 11:30 AM';
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
                    'Broadcast',
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
                    
                    // Department
                    CommonDropdownField(
                      labelText: 'Department',
                      value: selectedDepartment,
                      items: ['Kitchen', 'Housekeeping', 'Front Desk', 'Maintenance', 'Security'],
                      onChanged: (value) => setState(() => selectedDepartment = value!),
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    // Broadcast Trigger Date & Time
                    Text(
                      'Broadcast Trigger Date & Time',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: MyColors.dark000000,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: () {
                        // TODO: Show date time picker
                        _showDateTimePicker();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                        decoration: BoxDecoration(
                          color: MyColors.grayF5F5F5,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: MyColors.grayD0D5DD.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                dateTimeController.text,
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.gray667085,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.calendar_today_outlined,
                              color: MyColors.gray667085,
                              size: 20.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    // Message (Optional) with Voice button
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
                  // TODO: Implement submit broadcast
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

  void _showDateTimePicker() async {
    // Show date picker first
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: MyColors.dark000000,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: MyColors.dark000000,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      // Show time picker
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: MyColors.dark000000,
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: MyColors.dark000000,
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedTime != null) {
        // Format the selected date and time
        final DateTime combinedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        
        // Format as per the design: "20-06-2025 11:30 AM"
        final String formattedDateTime = 
            "${combinedDateTime.day.toString().padLeft(2, '0')}-${combinedDateTime.month.toString().padLeft(2, '0')}-${combinedDateTime.year} ${pickedTime.format(context)}";
        
        setState(() {
          dateTimeController.text = formattedDateTime;
        });
      }
    }
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

    // Show success message and go back
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Broadcast created successfully!',
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
    dateTimeController.dispose();
    super.dispose();
  }
}