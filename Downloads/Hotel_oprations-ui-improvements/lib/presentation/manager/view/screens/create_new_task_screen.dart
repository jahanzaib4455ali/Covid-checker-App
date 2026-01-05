import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/presentation/manager/view/screens/task_distribution_setting_screen.dart';

class CreateNewTaskScreen extends StatefulWidget {
  const CreateNewTaskScreen({super.key});

  @override
  State<CreateNewTaskScreen> createState() => _CreateNewTaskScreenState();
}

class _CreateNewTaskScreenState extends State<CreateNewTaskScreen> {
  bool isAutomationOn = true;
  bool isQRValidationOn = true;
  bool isTaskStartedValidationOn = true;
  bool isTaskCompletedValidationOn = true;
  bool isVoiceMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Select Department"),
            _buildDropdown("Housekeeping"),
            _buildLabel("Employee Assigned"),
            _buildDropdown("Rizwan 0001 / Open to All"),
            _buildLabel("Task Type"),
            _buildDropdown("Guest Experience"),
            _buildLabel("Task Location"),
            _buildDropdown("Room A-102"),
            _buildLabel("Task Priority"),
            _buildDropdown("Normal / Urgent"),
            _buildDescriptionSection(),
            SizedBox(height: 10.h),

            // Task Automation Section
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    "Task Automation",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: const Color(0xFF344054)),
                  ),
                  _buildCustomSwitch(isAutomationOn, (val) {
                    setState(() => isAutomationOn = val);
                  }),
                ],
              ),
            ),

            // Conditional Layout
            if (isAutomationOn) ...[
              _buildLabel("Automation Type"),
              _buildDropdown("Event Based"),
              _buildLabel("Select Event Type"),
              _buildDropdown("Guest Check-out"),

              _buildSwitchTile("Room QR Scan Validation", isQRValidationOn, (val) {
                setState(() => isQRValidationOn = val);
              }),
              _buildSwitchTile("Validation on Task Started", isTaskStartedValidationOn, (val) {
                setState(() => isTaskStartedValidationOn = val);
              }),
              _buildSwitchTile("Validation on Task Completed", isTaskCompletedValidationOn, (val) {
                setState(() => isTaskCompletedValidationOn = val);
              }),
            ] else ...[
              _buildLabel("Task Start Time"),
              _buildTimePickerField("24-05-2025 11:00 AM"),
              _buildLabel("Task End Time (Deadline)"),
              _buildTimePickerField("24-05-2025 11:30AM"),
            ],

            SizedBox(height: 30.h),
            _buildCreateButton(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

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

  // --- Other UI Helpers ---
  Widget _buildTimePickerField(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        border: Border.all(color: const Color(0xFFD0D5DD)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(text, style: TextStyle(fontSize: 15.sp, color: const Color(0xFF667085))),
          Icon(Icons.calendar_today_outlined, size: 18.sp, color: const Color(0xFF667085)),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(title, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: const Color(0xFF344054))),
          _buildCustomSwitch(value, onChanged),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
      title: TextView("Create New Task", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.black)),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h, bottom: 8.h),
      child: TextView(text, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: const Color(0xFF344054))),
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
          hint: TextView(hint, style: TextStyle(fontSize: 15.sp, color: const Color(0xFF667085))),
          items: [],
          onChanged: (value) {},
          icon: Icon(Icons.keyboard_arrow_down, color: const Color(0xFF667085)),
        ),
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLabel("Task Description"),
            GestureDetector(
              onTap: () => setState(() => isVoiceMode = !isVoiceMode),
              child: Container(
                margin: EdgeInsets.only(top: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  children: [
                    CircleAvatar(radius: 10.r, backgroundColor: Colors.black, child: TextView(isVoiceMode ? "A" : "V", style: TextStyle(color: Colors.white, fontSize: 8.sp))),
                    SizedBox(width: 5.w),
                    TextView(isVoiceMode ? "Text" : "Voice", style: TextStyle(fontSize: 12.sp)),
                  ],
                ),
              ),
            ),
          ],
        ),
        isVoiceMode ? _buildVoicePlayerUI() : _buildTextFieldUI(),
      ],
    );
  }

  Widget _buildVoicePlayerUI() {
    return Container(
      height: 65.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(color: const Color(0xFF1D1929), borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          Icon(Icons.play_circle_fill, color: Colors.white, size: 35.sp),
          SizedBox(width: 10.w),
          Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: List.generate(25, (i) => Container(width: 2.w, height: (i % 3 * 5 + 10).h, color: Colors.white)))),
        ],
      ),
    );
  }

  Widget _buildTextFieldUI() {
    return Container(
      height: 80.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(color: const Color(0xFFF9FAFB), border: Border.all(color: const Color(0xFFD0D5DD)), borderRadius: BorderRadius.circular(8.r)),
      child: TextField(decoration: InputDecoration(hintText: "Enter task details...", border: InputBorder.none, hintStyle: TextStyle(fontSize: 15.sp))),
    );
  }

  Widget _buildCreateButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          if (isAutomationOn) {
            // Agar ON hai to Distribution Setting par jao
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TaskDistributionSettingScreen()),
            );
          } else {
            // Agar OFF hai to Dashboard par jao (Jo aapki main screen hogi)
            // Navigator.pushNamed(context, '/dashboard'); 
          }
        },
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2B2838), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
        child: TextView("Create", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}