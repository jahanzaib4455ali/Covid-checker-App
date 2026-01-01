import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/app_drawer.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_loader_elevated_button.dart';
import 'package:kunggy_operational_app/common/widget/my_text_field.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/presentation/vendor/view/widgets/vendor_appbar.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class QuotePriceScreen extends StatelessWidget {
  const QuotePriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                const VendorAppbar(
                  isBackButton: true,
                ),
                SizedBox(
                  height: 32.h,
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 22.w, right: 10.w),
                    child: ListView(
                        children: List.generate(20, (i) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: i == 0
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (i == 0)
                                    TextView(
                                      "Product Name",
                                      style: myTextStyle.font_16ww400.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  if (i == 0)
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                  Flexible(
                                    child: TextView(
                                      "Hand Sanitizer (100ml)",
                                      style: myTextStyle.font_14w500.copyWith(
                                        color: MyColors.dark242424,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (i == 0)
                                      TextView(
                                        "Price",
                                        style: myTextStyle.font_10w400.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    if (i == 0)
                                      SizedBox(
                                        height: 17.h,
                                      ),
                                    CustomTextFormField(
                                      height: 40.h,
                                      width: 64.w,
                                      hintText: "\$19",
                                      borderColor: MyColors.grayD0D5DD,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (i == 0)
                                      TextView(
                                        "Quantity",
                                        style: myTextStyle.font_10w400.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    if (i == 0)
                                      SizedBox(
                                        height: 17.h,
                                      ),
                                    CustomTextFormField(
                                      height: 40.h,
                                      width: 59.w,
                                      hintText: "100",
                                      borderColor: MyColors.grayD0D5DD,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (i == 0)
                                      TextView(
                                        "Total Price",
                                        style: myTextStyle.font_10w400.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    if (i == 0)
                                      SizedBox(
                                        height: 17.h,
                                      ),
                                    CustomTextFormField(
                                      height: 40.h,
                                      width: 80.w,
                                      hintText: "\$1,900",
                                      borderColor: MyColors.grayD0D5DD,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList()),
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 11.w),
                  width: 1.sw,
                  height: 1,
                  color: MyColors.grayD0D5DD,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22.w, right: 19.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        "Total Bill",
                        style: myTextStyle.font_20wMedium.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextView(
                        "\$5875.00",
                        style: myTextStyle.font_20wMedium.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 11.w),
                  width: 1.sw,
                  height: 1,
                  color: MyColors.grayD0D5DD,
                ),
                SizedBox(
                  height: 31.h,
                ),
                TextView(
                  padding: EdgeInsets.only(left: 22.w),
                  "Expected Delivery Time & Date",
                  style: myTextStyle.font_16ww500,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22.w, right: 18.w),
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomTextFormField(
                          onTap: () {},
                          readOnly: true,
                          hintText: "12:00PM",
                          borderColor: MyColors.gray8C8C8C,
                          trailingWidget: SvgPicture.asset(
                            MyIcons.wallClock,
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Flexible(
                        child: CustomTextFormField(
                          onTap: () {},
                          readOnly: true,
                          hintText: "12-4-2024",
                          borderColor: MyColors.gray8C8C8C,
                          trailingWidget: SvgPicture.asset(
                            MyIcons.calendar,
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                MyLoaderElvButton(
                  padding: EdgeInsets.only(right: 19.w),
                  alignment: Alignment.centerRight,
                  borderRadius: 8,
                  height: 48.h,
                  width: 178.w,
                  onPressed: () {},
                  text: "Send Quote",
                  state: null,
                  textStyle: myTextStyle.font_14w500.copyWith(
                    color: MyColors.whiteFFFFFF,
                  ),
                ),
                SizedBox(
                  height: 38.h,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
