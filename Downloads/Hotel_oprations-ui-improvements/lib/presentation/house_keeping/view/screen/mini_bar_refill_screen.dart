import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/common_blur_modal.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_elevated_button.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class MiniBarRefillScreen extends StatefulWidget {
  const MiniBarRefillScreen({super.key});

  @override
  State<MiniBarRefillScreen> createState() => _MiniBarRefillScreenState();
}

class _MiniBarRefillScreenState extends State<MiniBarRefillScreen> {
  String selectedRoomNo = "A-101";
  String selectedRoomType = "Deluxe Room";

  final List<Map<String, dynamic>> items = [
    {"name": "RedBull 250ml (4 Pcs)", "std": 4, "waste": 0, "refill": 0},
    {"name": "Coca-Cola (4 Pcs)", "std": 4, "waste": 0, "refill": 0},
    {"name": "Whisky (4 Pcs)", "std": 4, "waste": 0, "refill": 0},
    {"name": "Cadbury (4 Pcs)", "std": 4, "waste": 0, "refill": 0},
    {"name": "Juices (4 Pcs)", "std": 4, "waste": 0, "refill": 0},
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
              "Minibar Refill",
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
              "Select Item / Type Related",
              style: myTextStyle.font_16ww500.copyWith(fontSize: 14.sp, color: MyColors.dark000000),
            ),
          ),

          // Table Header
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 8.h),
            child: Row(
              children: [
                Expanded(flex: 3, child: _tableHeader("Item Name")),
                Expanded(flex: 2, child: _tableHeader("Standard Qty")),
                Expanded(flex: 2, child: _tableHeader("Waste Qty")),
                Expanded(flex: 2, child: _tableHeader("Refill Qty")),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: items.length,
              separatorBuilder: (context, index) => Divider(color: Colors.grey.shade200, height: 1),
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
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
                        flex: 2,
                        child: _QuantityCounter(
                          value: item['waste'],
                          onChanged: (val) => setState(() => item['waste'] = val),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: _QuantityCounter(
                          value: item['refill'],
                          onChanged: (val) => setState(() => item['refill'] = val),
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
            child: MyElevatedButton(
              text: "Submit",
              onPressed: () {
                _showLanguageConfirmationModal();
              },
              height: 52.h,
              buttonBGColor: MyColors.primaryDark1D1929,
              textStyle: myTextStyle.font_16ww500.copyWith(color: Colors.white),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableHeader(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
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

  void _showLanguageConfirmationModal() {
    // Filter items that have a refill quantity > 0
    final refilledItems = items.where((item) => item['refill'] > 0).toList();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CommonBlurModal(
          topOffset: -65.h,
          onClose: () => Navigator.pop(context),
          child: Container(
            padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 40.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextView(
                  "Minibar Refill Confirmation",
                  style: myTextStyle.font_20wMedium.copyWith(
                    fontSize: 24.h,
                    fontWeight: FontWeight.w800,
                    color: MyColors.primaryDark1D1929,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                TextView(
                  "You are refilling minibar items in room please confirm the task to post.",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 15.h,
                    color: MyColors.gray6E7C87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),

                // Confirmation Details Box
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: MyColors.grayE5E5E5, width: 1),
                  ),
                  child: Column(
                    children: [
                      // Room Number Row
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              "Room Number",
                              style: myTextStyle.font_14w400.copyWith(
                                fontSize: 16.h,
                                color: MyColors.dark000000,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextView(
                              selectedRoomNo,
                              style: myTextStyle.font_14w500.copyWith(
                                fontSize: 16.h,
                                color: MyColors.gray6E7C87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1, color: MyColors.grayE5E5E5),
                      
                      // Items List Header
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              "Added Items",
                              style: myTextStyle.font_14w400.copyWith(
                                fontSize: 16.h,
                                color: MyColors.dark000000,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextView(
                              "Quantity",
                              style: myTextStyle.font_14w400.copyWith(
                                fontSize: 16.h,
                                color: MyColors.dark000000,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Dynamic Items
                      ...refilledItems.map((item) => Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              item['name'].toString().split('(').first.trim(),
                              style: myTextStyle.font_14w400.copyWith(
                                fontSize: 16.h,
                                color: MyColors.dark000000,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextView(
                              "${item['refill']} Piece",
                              style: myTextStyle.font_14w400.copyWith(
                                fontSize: 16.h,
                                color: MyColors.gray6E7C87,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )).toList(),
                      
                      if (refilledItems.isEmpty)
                        Padding(
                          padding: EdgeInsets.all(16.h),
                          child: TextView(
                            "No items added",
                            style: myTextStyle.font_14w400.copyWith(color: Colors.red),
                          ),
                        ),
                        
                      SizedBox(height: 8.h),
                    ],
                  ),
                ),

                SizedBox(height: 40.h),

                // Confirm Button
                MyElevatedButton(
                  text: "Confirm",
                  onPressed: () {
                    Navigator.pop(context); // Close modal
                    // Success feedback or navigation
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Minibar Refill Task Posted!"), backgroundColor: Colors.green),
                    );
                    Navigator.pop(context); // Back to previous screen
                  },
                  width: double.infinity,
                  height: 60.h,
                  buttonBGColor: MyColors.primaryDark1D1929,
                  textStyle: myTextStyle.font_16ww500.copyWith(
                    fontSize: 18.h,
                    color: MyColors.whiteFFFFFF,
                    fontWeight: FontWeight.w700,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ],
            ),
          ),
        );
      },
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
          padding: EdgeInsets.symmetric(horizontal: 8.w),
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
        width: 24.w,
        height: 24.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

