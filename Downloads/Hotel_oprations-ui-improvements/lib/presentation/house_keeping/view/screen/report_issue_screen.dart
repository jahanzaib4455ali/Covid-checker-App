import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class ReportIssueScreen extends StatefulWidget {
  const ReportIssueScreen({super.key});

  @override
  State<ReportIssueScreen> createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  String selectedCategory = "Maintenance Issue";
  String selectedRoomType = "Deluxe Room";
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: true,
      isProfile: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              "Issue Report",
              style: myTextStyle.font_20wMedium.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),
            
            _buildLabel("Select Category"),
            _buildDropdown(selectedCategory, ["Maintenance Issue", "Cleaning Issue", "Other"]),
            
            SizedBox(height: 16.h),
            _buildLabel("Select Room Type"),
            _buildDropdown(selectedRoomType, ["Deluxe Room", "Standard Room", "Suite"]),
            
            SizedBox(height: 16.h),
            _buildLabel("Short Description (Optional)"),
            Container(
              height: 120.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Maintenance team requested for...",
                  hintStyle: myTextStyle.font_14w400.copyWith(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12.w),
                ),
              ),
            ),
            
            SizedBox(height: 24.h),
            _buildLabel("Or Give voice record Note:"),
            
            // Voice Recorder Box
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _waveBar(15.h),
                      _waveBar(25.h),
                      _waveBar(40.h),
                      _waveBar(20.h),
                      _waveBar(35.h),
                      _waveBar(10.h),
                      _waveBar(30.h),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  TextView(
                    "00:09",
                    style: myTextStyle.font_14w600.copyWith(color: Colors.red),
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () => setState(() => isRecording = !isRecording),
                    child: Container(
                      width: 60.w,
                      height: 60.w,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isRecording ? Icons.stop : Icons.mic,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextView(
                    isRecording ? "Stop Recording" : "Tap to Record",
                    style: myTextStyle.font_12w400.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () {
                  _showConfirmation();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryDark1D1929,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: TextView(
                  "Report",
                  style: myTextStyle.font_16ww500.copyWith(color: Colors.white),
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
      padding: EdgeInsets.only(bottom: 8.h),
      child: TextView(
        text,
        style: myTextStyle.font_12w400.copyWith(color: Colors.grey.shade600),
      ),
    );
  }

  Widget _buildDropdown(String value, List<String> items) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: myTextStyle.font_14w600))).toList(),
          onChanged: (val) {
            if (val != null) setState(() => selectedCategory = val);
          },
        ),
      ),
    );
  }

  Widget _waveBar(double height) {
    return Container(
      width: 4.w,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  void _showConfirmation() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
              ),
              TextView("Issue Report Confirmation", style: myTextStyle.font_18w600),
              SizedBox(height: 8.h),
              TextView(
                "You are refining Ambience/Amenities for Room A-101, please confirm your entry before submit.",
                textAlign: TextAlign.center,
                style: myTextStyle.font_12w400.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 20.h),
              _confirmRow("Room Number", "A-101"),
              _confirmRow("Room Type", "Deluxe Room"),
              _confirmRow("Issue Type", "Maintenance"),
              const Divider(),
              TextView("Voice record Added Successfully", style: myTextStyle.font_12w400.copyWith(color: Colors.green)),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.primaryDark1D1929,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: TextView("Confirm", style: myTextStyle.font_14w500.copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _confirmRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: myTextStyle.font_12w400.copyWith(color: Colors.grey.shade600)),
          Text(value, style: myTextStyle.font_14w600),
        ],
      ),
    );
  }
}
