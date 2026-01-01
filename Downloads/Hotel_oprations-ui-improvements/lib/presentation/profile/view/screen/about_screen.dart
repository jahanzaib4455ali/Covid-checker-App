import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: true,
      isProfile: false,
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  "About the App",
                  style: myTextStyle.font_16ww500.copyWith(
                    fontSize: 18.h,
                    color: MyColors.dark07090D,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextView(
                  "Lorem ipsum dolor sit amet, consectetur to elit, sed do eiusmod tempor incididunt ut labore know dolore magna aliqua enim ad minim veniam, quis the nostrud exercitation ullamco laboris nisi ut in aliquip ex a ea commodo consequat. Duis aute a irure excepteur the dolorreprehenderit in know to voluptate velit esse cillum know dolore eu fugiat nulla pariatur excepteur sint deser to  occaecat cupidatat non proident, sunt in culpa qui the see officia deserunt mollit anim id est laborum know adipiscing",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 16.h,
                    color: const Color(0xff847C7C),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextView(
                  "Tempor orci eu lobortis elementum the nibh know vulputate enim nulla aliquet porttitor lacus an to  two sagittis ui eu volutpat odio semper auctor the know the know a the neque vitae tempus quam a pellentesque to nec. know quam lacus adipiscing suspendisse faucibus interdum posuere a lorem a ipsum dolor. commodo elit at suscipit a tellus to a imperdiet dui is vitae suscipit tellus mauris a new the diam. erat aliquet pellentesque adipiscing the commodo elit at imperdiet dui ipsum faucibus to vitae aliquet the a know pulvinar the ullamcorper. Pellentesque pulvinar morbi tristique senectus et.",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 16.h,
                    color: const Color(0xff847C7C),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextView(
                  "commodo elit at suscipit a tellus to imperdiet the know to vitae suscipit tellus mauris a new the dia erat ipsum a aliquet pellentesque adipiscing the know commodo imperdiet dui ipsum faucibus in vitae aliquet the a know pulvinar the ullamcorper pellentesque pulvinar morbi adipiscing know me",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 16.h,
                    color: const Color(0xff847C7C),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextView(
                  "Lorem ipsum dolor sit amet, consectetur to elit, sed do eiusmod tempor incididunt ut labore know dolore magna aliqua enim ad minim veniam, quis the nostrud exercitation ullamco laboris nisi ut in aliquip ex a ea commodo consequat. Duis aute a irure excepteur the dolorreprehenderit in know to voluptate velit esse cillum know dolore eu fugiat nulla pariatur excepteur sint deser to  occaecat cupidatat non proident, sunt in culpa qui the see officia deserunt mollit anim id est laborum know adipiscing",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 16.h,
                    color: const Color(0xff847C7C),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
