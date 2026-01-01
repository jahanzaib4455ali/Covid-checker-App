import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_elevated_button.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_floating_button.dart';


import '../../../../l10n/app_localizations.dart';
import '../../../../theme/my_icons.dart';

class VendorOrderInScreen extends StatefulWidget {
  const VendorOrderInScreen({super.key});

  @override
  _VendorOrderInScreenState createState() => _VendorOrderInScreenState();
}

class _VendorOrderInScreenState extends State<VendorOrderInScreen> {
  bool? isPriceAgreed;
  bool? isDispatchOrder;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: false,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 23.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        MyIcons.arrowRight,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    TextView(
                      "Food Order For",
                      style: myTextStyle.font_20wMedium.copyWith(
                        fontSize: 20.h,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.w),
              margin: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.whiteFFFFFF,
                boxShadow: [
                  BoxShadow(
                    color: MyColors.dark000000.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    "Vendor Order List",
                    style: myTextStyle.font_20wMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: MyColors.dark242424,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextView(
                    "Vendor Name: Z Mart",
                    style: myTextStyle.font_16ww400.copyWith(
                      color: MyColors.primaryDark1D1929,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        AppLocalizations.of(context)?.productName ?? "Product Name",
                        style: myTextStyle.font_16ww400.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextView(
                        AppLocalizations.of(context)?.quantity ?? "Quantity",
                        style: myTextStyle.font_16ww400.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 11,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                "Hand Sanitizer (300ml)",
                                style: myTextStyle.font_14w500.copyWith(
                                  color: MyColors.dark242424,
                                ),
                              ),
                              TextView(
                                "100",
                                style: myTextStyle.font_14w500,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(color: MyColors.grayF0F0F0),
                  _buildInfoRow("Total Bill", "\$5875.00"),
                  const Divider(color: MyColors.grayF0F0F0),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          "Delivery Time & Date",
                          style: myTextStyle.font_14w500,
                        ),
                        TextView(
                          "12:00 PM   12-4-2024",
                          style: myTextStyle.font_14w500,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(
                        child: MyElevatedButton(
                          height: 48.h,
                          buttonBGColor: Colors.transparent,
                          text: "Match Order With This List",
                          textStyle: myTextStyle.font_14w500.copyWith(
                            color: MyColors.primaryDark1D1929,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: MyFloatingButton(
                         text: "IN",

                          backgroundColor: MyColors.primaryDark1D1929,  // Set background color
                          textColor: Colors.white,  // Set text color
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
            label,
            style: myTextStyle.font_14w500,
          ),
          TextView(
            value,
            style: myTextStyle.font_14w500,
          ),
        ],
      ),
    );
  }
}
