import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_elevated_button.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import '../../../base_screen/view/screen/manager_base_screen.dart';
import 'language_screen.dart';
import 'access_pending_screen.dart';
import 'login_screen.dart';

class LocationAccessScreen extends StatelessWidget {
  const LocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, size: 32),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const LoginScreen()),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Map/location image placeholder
            Center(
              child: Image.asset(
                'assets/images/location.png',
                width: 154,
                height: 171,
                fit: BoxFit.cover,
              )

            ),
            SizedBox(height: 32.h),
            TextView(
              'Allow Location Access',
              style: myTextStyle.font_10w400.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: MyColors.primaryDark1D1929,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: TextView(
                'We use this to show near by locations. you can edit accessin your phones settings',
                style: myTextStyle.font_14w500.copyWith(
                  fontSize: 16,
                  color: MyColors.gray6E7C87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: TextView(
                'By allowing access, you consent to share your personal info with googl maps as stated in the ',
                style: myTextStyle.font_10w400.copyWith(
                  fontSize: 15,
                  color: MyColors.gray6E7C87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: GestureDetector(
                onTap: () {
                  // TODO: Open privacy policy
                },
                child: Text(
                  'Privacy Policy',
                  style: myTextStyle.font_10w400.copyWith(
                    fontSize: 15,
                    color: MyColors.primaryDark1D1929,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: MyElevatedButton(
                text: 'Allow Access',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LanguageScreen()),
                  );
                },
                height: 56,
                buttonBGColor: MyColors.primaryDark1D1929,
                textStyle: myTextStyle.font_20wMedium.copyWith(
                  fontSize: 20.h,
                  color: MyColors.whiteFFFFFF,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
} 