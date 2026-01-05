import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

import '../../l10n/app_localizations.dart';
import '../../presentation/manager/view/screens/manager_notifications_screen.dart';

class GeneralAppBar extends StatelessWidget {
  const GeneralAppBar(
      {super.key,
        required this.isBackButton,
        this.isNotification,
        this.isProfile});

  final bool isBackButton;
  final bool? isNotification;
  final bool? isProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isBackButton
              ? Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(MyIcons.arrowRight),
              ),
              SizedBox(
                width: 32.w,
              ),
              TextView(
                AppLocalizations.of(context)?.kunggy ?? "Kunggy",
                style: myTextStyle.font_32w700.copyWith(
                  fontWeight: FontWeight.w800,
                  color: MyColors.primaryGreen00A35E,
                ),
              ),
            ],
          )
              : InkWell(
            splashColor: MyColors.transparent,
            highlightColor: MyColors.transparent,
            onTap: () {},
            child: SvgPicture.asset(
              MyIcons.logo,
            ),
          ),

          // Right Side Actions
          isProfile ?? false
              ? const SizedBox.shrink() // Agar profile true hai toh language ki jagah kuch nahi dikhayega
              : Row(
            children: [
              if (isNotification == null)
                InkWell(
                  splashColor: MyColors.transparent,
                  highlightColor: MyColors.transparent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ManagerNotificationsScreen(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    MyIcons.bell,
                  ),
                ),
              // Language icon aur uska SizedBox yahan se delete kar diya gaya hai
              if (isNotification == null)
                SizedBox(
                  width: 18.w,
                ),
              InkWell(
                splashColor: MyColors.transparent,
                highlightColor: MyColors.transparent,
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: SvgPicture.asset(
                  MyIcons.menu,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}