import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_elevated_button.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class MyQuotationTab extends StatelessWidget {
  const MyQuotationTab({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.only(left: 16.w, right: 11.w, top: 16.h, bottom: 18.h),
      margin: EdgeInsets.only(left: 18.w, right: 18.w, bottom: 32.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.whiteFFFFFF,
          boxShadow: [
            BoxShadow(
              color: MyColors.dark000000.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            "Vendor Quotation",
            style: myTextStyle.font_20wMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: MyColors.dark242424,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              TextView(
                "#123456",
                style: myTextStyle.font_12w400.copyWith(
                  color: MyColors.gray979797,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Container(
                width: 1,
                height: 11,
                color: MyColors.gray979797,
              ),
              SizedBox(
                width: 16.w,
              ),
              TextView(
                "12:35 PM",
                style: myTextStyle.font_12w400.copyWith(
                  color: MyColors.gray979797,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13.h,
          ),
          Center(
            child: Container(
              height: 1,
              color: MyColors.grayF0F0F0,
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Flexible(
            child: ListView(
                shrinkWrap: true,
                children: List.generate(20, (i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
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
                                  height: 7.h,
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
                        SizedBox(
                          width: 8.w,
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (i == 0)
                                TextView(
                                  "Price",
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
                                  "\$19",
                                  style: myTextStyle.font_14w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SizedBox(
                          width: 80.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (i == 0)
                                TextView(
                                  "Quantity",
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
                                  "100",
                                  style: myTextStyle.font_14w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SizedBox(
                          width: 80.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (i == 0)
                                TextView(
                                  "Total Price",
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
                                  "\$1900",
                                  style: myTextStyle.font_14w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList()),
          ),
          SizedBox(
            height: 13.h,
          ),
          Center(
            child: Container(
              height: 1,
              color: MyColors.grayF0F0F0,
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                "Total Bill",
                style: myTextStyle.font_16ww500.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextView(
                "\$5875.00",
                style: myTextStyle.font_16ww500.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13.h,
          ),
          Center(
            child: Container(
              height: 1,
              color: MyColors.grayF0F0F0,
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          TextView(
            "Delivery Time & Date",
            style: myTextStyle.font_16ww500.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextView(
            "12:00PM 12-4-2024",
            style: myTextStyle.font_16ww500.copyWith(
                fontWeight: FontWeight.w500, color: MyColors.gray7C7C7C),
          ),
          SizedBox(
            height: 13.h,
          ),
          Center(
            child: Container(
              height: 1,
              color: MyColors.grayF0F0F0,
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyElevatedButton(
                  border: Border.all(
                    color: MyColors.primaryDark1D1929,
                  ),
                  width: 146.w,
                  height: 48.h,
                  buttonBGColor: MyColors.whiteFFFFFF,
                  text: "Edit",
                  textStyle: myTextStyle.font_10w400.copyWith(
                    color: MyColors.primaryDark1D1929,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.h,
                  ),
                  onPressed: () {},
                ),
                MyElevatedButton(
                  width: 146.w,
                  height: 48.h,
                  text: "Send Quote",
                  textStyle: myTextStyle.font_10w400.copyWith(
                    color: MyColors.whiteFFFFFF,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.h ,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
        ],
      ),
    );
  }
}
