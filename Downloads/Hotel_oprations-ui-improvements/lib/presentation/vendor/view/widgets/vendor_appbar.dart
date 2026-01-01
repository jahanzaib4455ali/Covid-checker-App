import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';

class VendorAppbar extends StatefulWidget {
  const VendorAppbar({
    super.key,
    this.isBackButton,
  });

  final bool? isBackButton;

  @override
  State<VendorAppbar> createState() => _VendorAppbarState();
}

class _VendorAppbarState extends State<VendorAppbar> {
  String selectedRoom = "Royal Hotel";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.isBackButton ?? false)
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(MyIcons.arrowRight),
            ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 0.w, right: 0.w),
              child: SizedBox(
                width: 200.w,
                child: DropdownButton(
                  isExpanded: true,
                  icon: SvgPicture.asset(
                    MyIcons.arrowDropBold,
                    width: 19.w,
                  ),
                  value: selectedRoom,
                  underline: const SizedBox.shrink(),
                  items: ["Royal Hotel"].map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: myTextStyle.font_32w700.copyWith(
                          fontWeight: FontWeight.w800,
                          color: MyColors.primaryDark1D1929,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (p0) {
                    selectedRoom = p0 ?? "1";
                  },
                  dropdownColor: Colors.white,
                ),
              ),
            ),
          ),
          // TextView(
          //   "Royal Hotel",
          // style: myTextStyle.font_32w700.copyWith(
          //   fontWeight: FontWeight.w800,
          //   color: MyColors.primaryDark1D1929,
          // ),
          // ),
          Row(
            children: [
              InkWell(
                splashColor: MyColors.transparent,
                highlightColor: MyColors.transparent,
                onTap: () {
                  Navigator.pushNamed(context, Routes.notificationScreen);
                },
                child: SvgPicture.asset(
                  MyIcons.bell,
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              InkWell(
                splashColor: MyColors.transparent,
                highlightColor: MyColors.transparent,
                onTap: () {},
                child: SvgPicture.asset(
                  MyIcons.language,
                ),
              ),
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
