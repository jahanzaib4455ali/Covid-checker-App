import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';
import '../../../../common/widget/my_buttons/my_elevated_button.dart';

class PriceQuotationTab extends StatelessWidget {
  const PriceQuotationTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                    "Order Received",
                    style: myTextStyle.font_16ww500.copyWith(
                      fontWeight: FontWeight.w600,
                      color: MyColors.gray7F7F7F,
                    ),
                  ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.orderHistoryListScreen);
                  },
                  child: TextView(
                    "Orders History",
                    style: myTextStyle.font_16ww400.copyWith(
                      color: MyColors.primaryDark1D1929,
                      decoration: TextDecoration.underline,
                      decorationColor: MyColors.primaryDark1D1929,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.h),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Number of purchase orders
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    bottom: 16.h,
                    left: 17.w,
                    right: 17.w,
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.whiteFFFFFF,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 4,
                        color: MyColors.dark000000.withOpacity(0.2),
                      )
                    ],
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            "Purchase Order ${index + 1}",
                            style: myTextStyle.font_16ww500.copyWith(
                              fontWeight: FontWeight.w600,
                              color: MyColors.dark242424,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              TextView(
                                "PO No: 123456",
                                style: myTextStyle.font_12w400.copyWith(
                                  color: MyColors.gray979797,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Container(
                                width: 1,
                                height: 11,
                                color: MyColors.gray979797,
                              ),
                              SizedBox(width: 16.w),
                              TextView(
                                "12:35 PM",
                                style: myTextStyle.font_12w400.copyWith(
                                  color: MyColors.gray979797,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: const BoxDecoration(
                          color: MyColors.primaryDark1D1929,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: MyColors.whiteFFFFFF,
                          size: 20,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: Column(
                            children: [
                              const Divider(color: MyColors.grayF0F0F0),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (context, i) {
                                  final items = [
                                    "Hand Sanitizer (300ml)",
                                    "Lux Soap (Regular)",
                                    "Tooth Brush (Premium)",
                                    "Colgate Tooth Paste (Small)",
                                    "Room Freshner Spray (Regular)",
                                    "Hand Sanitizer (300ml)",
                                    "Lux Soap (Regular)",
                                    "Tooth Brush (Premium)",
                                    "Colgate Tooth Paste (Small)",
                                    "Room Freshner Spray (Regular)",
                                  ];
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 12.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          items[i],
                                          style: myTextStyle.font_14w400.copyWith(
                                            color: MyColors.dark242424,
                                          ),
                                        ),
                                        TextView(
                                          "100Pcs",
                                          style: myTextStyle.font_14w400.copyWith(
                                            color: MyColors.dark242424,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MyElevatedButton(
                                    width: 146.w,
                                    height: 48.h,
                                    text: "Quote  Price",
                                    textStyle: myTextStyle.font_10w400.copyWith(
                                      color: MyColors.whiteFFFFFF,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.h,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, Routes.quotePriceScreen);
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
