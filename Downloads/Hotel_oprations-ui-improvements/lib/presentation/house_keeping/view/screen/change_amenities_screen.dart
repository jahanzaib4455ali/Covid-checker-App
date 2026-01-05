import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/src_general_scaffold.dart';
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
  String selectedRoomType = "Deluxe Suit Room";

  // Updated data to match screenshot
  final List<Map<String, dynamic>> amenities = [
    {"name": "Hand Sanitizer", "size": "100ml", "std": 1, "refilled": 1},
    {"name": "Towel", "size": "", "std": 1, "refilled": 1},
    {"name": "Bath Robe", "size": "", "std": 1, "refilled": 1},
    {"name": "Hand Towel", "size": "", "std": 1, "refilled": 1},
    {"name": "Shampoo", "size": "100ml", "std": 1, "refilled": 1},
    {"name": "Conditioner", "size": "100ml", "std": 1, "refilled": 1},
  ];

  @override
  Widget build(BuildContext context) {
    return SrcGeneralScaffold(
      isBackButton: false,
      showAppBar: false,
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Header with back button
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    child: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
                  ),
                ),
                SizedBox(width: 12.w),
                TextView(
                  "Amenities Change",
                  style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black),
                ),
              ],
            ),
          ),

          // Room Selection Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Row(
              children: [
                _buildSelectionField("Select Room No", selectedRoomNo),
                SizedBox(width: 12.w),
                _buildSelectionField("Room Type", selectedRoomType),
              ],
            ),
          ),

          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextView(
              "Select Items You Added:",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ),

          // Table Header
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 10.h),
            child: Row(
              children: [
                Expanded(flex: 3, child: _tableHeader("Item Name", align: TextAlign.left)),
                Expanded(flex: 2, child: _tableHeader("Standard\nQuantity")),
                Expanded(flex: 2, child: _tableHeader("Refilled\nQuantity")),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: amenities.length,
              itemBuilder: (context, index) {
                final item = amenities[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    children: [
                      // Item Name & Size
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(item['name'], style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                            if (item['size'].isNotEmpty)
                              TextView(item['size'], style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.grey)),
                          ],
                        ),
                      ),
                      // Standard Quantity (Static Text)
                      Expanded(
                        flex: 2,
                        child: Center(child: TextView("${item['std']}", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black))),
                      ),
                      SizedBox(width: 8.w),
                      // Refilled Quantity (Dropdown Style)
                      Expanded(
                        flex: 2,
                        child: _buildQtyDropdown("${item['refilled']}"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Submit Button
          Padding(
            padding: EdgeInsets.all(20.w),
            child: SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () => _showConfirmation(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D1929),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                ),
                child: TextView("Submit", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableHeader(String text, {TextAlign align = TextAlign.center}) {
    return TextView(
      text,
      textAlign: align,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.grey.shade600),
    );
  }

  // Selection Field UI as per screenshot
  Widget _buildSelectionField(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(label, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(value, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Dropdown UI for Quantity as per screenshot
  Widget _buildQtyDropdown(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(value, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
          const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.black54),
        ],
      ),
    );
  }

  void _showConfirmation() {
    // Simple confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: TextView("Confirmation", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
        content: TextView("Are you sure you want to submit the amenities changes?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: TextView("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1D1929)),
            child: TextView("Confirm", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
