import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class ChangeAmenitiesScreen extends StatefulWidget {
  const ChangeAmenitiesScreen({super.key});

  @override
  State<ChangeAmenitiesScreen> createState() => _ChangeAmenitiesScreenState();
}

class _ChangeAmenitiesScreenState extends State<ChangeAmenitiesScreen> {
  String selectedRoomNo = "A-101";
  String selectedRoomType = "Deluxe Room";

  final List<Map<String, dynamic>> amenities = [
    {"name": "Hand Sanitizer (100ml)", "std": 1, "added": 0},
    {"name": "Towels", "std": 3, "added": 0},
    {"name": "Duster Cloth", "std": 1, "added": 0},
    {"name": "Dental Kit box", "std": 2, "added": 0},
    {"name": "Shaving Kit box", "std": 1, "added": 0},
    {"name": "Sandal/Slipper in pairs", "std": 1, "added": 0},
  ];

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: true,
      isProfile: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: TextView(
              "Change Amenities",
              style: myTextStyle.font_20wMedium.copyWith(fontWeight: FontWeight.w600),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Row(
              children: [
                _buildInfoField("Select Room No", selectedRoomNo),
                SizedBox(width: 12.w),
                _buildInfoField("Room Type", selectedRoomType),
              ],
            ),
          ),

          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextView(
              "Select Items You Added:",
              style: myTextStyle.font_16ww500.copyWith(fontSize: 14.sp, color: MyColors.dark000000),
            ),
          ),

          // Table Header
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 8.h),
            child: Row(
              children: [
                Expanded(flex: 4, child: _tableHeader("Product", align: TextAlign.left)),
                Expanded(flex: 2, child: _tableHeader("Standard Qty")),
                Expanded(flex: 3, child: _tableHeader("Added Quantity")),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: amenities.length,
              separatorBuilder: (context, index) => Divider(color: Colors.grey.shade200, height: 1),
              itemBuilder: (context, index) {
                final item = amenities[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          item['name'],
                          style: myTextStyle.font_12w400.copyWith(fontSize: 12.sp),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            "${item['std']}",
                            style: myTextStyle.font_14w600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: _QuantityCounter(
                          value: item['added'],
                          onChanged: (val) => setState(() => item['added'] = val),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20.w),
            child: SizedBox(
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
                  "Submit",
                  style: myTextStyle.font_16ww500.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableHeader(String text, {TextAlign align = TextAlign.center}) {
    return Text(
      text,
      textAlign: align,
      style: myTextStyle.font_12w400.copyWith(color: Colors.grey.shade500, fontSize: 11.sp),
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            label,
            style: myTextStyle.font_12w400.copyWith(color: Colors.grey.shade600),
          ),
          SizedBox(height: 6.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value, style: myTextStyle.font_14w600),
                Icon(Icons.keyboard_arrow_down, size: 20.sp, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmation() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              TextView(
                "Change Amenities Confirmation",
                style: myTextStyle.font_18w600,
              ),
              SizedBox(height: 8.h),
              TextView(
                "You are refining Ambience/Amenities for Room A-101, please confirm your entry before submit.",
                textAlign: TextAlign.center,
                style: myTextStyle.font_12w400.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 20.h),
              _confirmRow("Room Number", "A-101"),
              _confirmRow("Room Type", "Deluxe Room"),
              const Divider(),
              _confirmRow("Product", "Added Quantity", isHeader: true),
              _confirmRow("Hand Sanitizer", "1 Piece"),
              _confirmRow("Dental Kit", "2 Piece"),
              _confirmRow("Dental Pasta", "2 Piece"),
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

  Widget _confirmRow(String label, String value, {bool isHeader = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: isHeader ? myTextStyle.font_14w600 : myTextStyle.font_12w400.copyWith(color: Colors.grey.shade600)),
          Text(value, style: isHeader ? myTextStyle.font_14w600 : myTextStyle.font_14w600),
        ],
      ),
    );
  }
}

class _QuantityCounter extends StatelessWidget {
  final int value;
  final Function(int) onChanged;

  const _QuantityCounter({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _btn("-", () {
          if (value > 0) onChanged(value - 1);
        }),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text("$value", style: myTextStyle.font_14w600),
        ),
        _btn("+", () {
          onChanged(value + 1);
        }),
      ],
    );
  }

  Widget _btn(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
