import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool switch1 = true;
  bool switch2 = true;
  bool switch3 = true;
  bool switch4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextView(
          "Settings",
          style: myTextStyle.font_16ww500.copyWith(fontSize: 20.sp),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            _buildSwitchTile("Lorem Ipsum", switch1, (value) {
              setState(() => switch1 = value);
            }),
            _buildSwitchTile("Lorem Ipsum", switch2, (value) {
              setState(() => switch2 = value);
            }),
            _buildSwitchTile("Lorem Ipsum", switch3, (value) {
              setState(() => switch3 = value);
            }),
            _buildSwitchTile("Lorem Ipsum", switch4, (value) {
              setState(() => switch4 = value);
            }),
            SizedBox(height: 20.h),
            _buildNavigationTile("Languages", "English", Routes.languageScreen),
            _buildNavigationTile("Currency", "\$-USD", Routes.currencyScreen),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Column(
      children: [
        SwitchListTile(
          title: TextView(
            title,
            style: myTextStyle.font_16ww400,
          ),
          value: value,
          activeColor: MyColors.whiteFFFFFF, // Thumb (dot) color when active
          activeTrackColor: MyColors.primaryDark1D1929, // Background color when active
          onChanged: onChanged,
        ),
        const Divider(color: MyColors.grayD0D5DD),
      ],
    );
  }

  Widget _buildNavigationTile(String title, String value, String route) {
    return Column(
      children: [
        ListTile(
          title: TextView(
            title,
            style: myTextStyle.font_16ww400,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextView(
                value,
                style: myTextStyle.font_16ww400.copyWith(color: MyColors.grayB8B8B8),
              ),
              Icon(Icons.arrow_forward_ios, size: 16.w, color: MyColors.grayB8B8B8),
            ],
          ),
          onTap: () => Navigator.pushNamed(context, route),
        ),
        const Divider(color: MyColors.grayD0D5DD),
      ],
    );
  }
}
