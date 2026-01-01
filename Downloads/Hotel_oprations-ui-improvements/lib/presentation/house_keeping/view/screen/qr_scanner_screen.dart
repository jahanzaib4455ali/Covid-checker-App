import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: true,
      isProfile: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            TextView(
              "Scan a Room",
              style: myTextStyle.font_20wMedium.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12.h),
            TextView(
              "Saan any room qr code and it will automatically list you all the task of this room.",
              textAlign: TextAlign.center,
              style: myTextStyle.font_14w400.copyWith(color: Colors.grey, height: 1.5),
            ),
            
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // QR Frame
                    Container(
                      width: 280.w,
                      height: 280.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                          ),
                          child: Icon(Icons.qr_code_2, size: 200.sp, color: Colors.grey.shade200),
                        ),
                      ),
                    ),
                    
                    // Scanning Line simulation
                    Positioned(
                      top: 140.w,
                      child: Container(
                        width: 240.w,
                        height: 2.h,
                        color: Colors.red,
                        // This could be animated in a real app
                      ),
                    ),
                    
                    // Corners
                    _buildCorners(),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 40.h),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.flash_on, size: 30.sp, color: MyColors.primaryDark1D1929),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildCorners() {
    return SizedBox(
      width: 280.w,
      height: 280.w,
      child: Stack(
        children: [
          _corner(top: 0, left: 0, ang: 0),
          _corner(top: 0, right: 0, ang: 90),
          _corner(bottom: 0, left: 0, ang: 270),
          _corner(bottom: 0, right: 0, ang: 180),
        ],
      ),
    );
  }

  Widget _corner({double? top, double? left, double? right, double? bottom, required double ang}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Transform.rotate(
        angle: ang * 3.14159 / 180,
        child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: MyColors.primaryDark1D1929, width: 4),
              left: BorderSide(color: MyColors.primaryDark1D1929, width: 4),
            ),
          ),
        ),
      ),
    );
  }
}