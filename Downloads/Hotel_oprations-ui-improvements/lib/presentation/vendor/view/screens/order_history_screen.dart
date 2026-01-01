import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: false,
      isProfile: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with back button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(MyIcons.arrowLeft),
                ),
                SizedBox(width: 12.w),
                TextView(
                  "Order History",
                  style: myTextStyle.font_20wMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          
          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 11.w,
                  top: 16.h,
                  bottom: 18.h,
                ),
                margin: EdgeInsets.only(
                  left: 18.w,
                  right: 18.w,
                  bottom: 32.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.whiteFFFFFF,
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.dark000000.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      "Order List",
                      style: myTextStyle.font_20wMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: MyColors.dark242424,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    
                    // Order ID and Time
                    Row(
                      children: [
                        TextView(
                          "#123456",
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
                    SizedBox(height: 13.h),
                    
                    // Divider
                    Center(
                      child: Container(
                        height: 1,
                        color: MyColors.grayF0F0F0,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    
                    // Order items list
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 11,
                      itemBuilder: (context, index) {
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
                                    if (index == 0)
                                      TextView(
                                        "Product Name",
                                        style: myTextStyle.font_16ww400.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    if (index == 0)
                                      SizedBox(height: 7.h),
                                    TextView(
                                      "Hand Sanitizer (300ml)",
                                      style: myTextStyle.font_14w500.copyWith(
                                        color: MyColors.dark242424,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.w),
                              SizedBox(
                                width: 50.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (index == 0)
                                      TextView(
                                        "Price",
                                        style: myTextStyle.font_16ww400.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    if (index == 0) SizedBox(height: 7.h),
                                    TextView(
                                      "\$19",
                                      style: myTextStyle.font_14w500,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.w),
                              SizedBox(
                                width: 80.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (index == 0)
                                      TextView(
                                        "Quantity",
                                        style: myTextStyle.font_16ww400.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    if (index == 0) SizedBox(height: 7.h),
                                    TextView(
                                      "100",
                                      style: myTextStyle.font_14w500,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.w),
                              SizedBox(
                                width: 80.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (index == 0)
                                      TextView(
                                        "Total Price",
                                        style: myTextStyle.font_16ww400.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    if (index == 0) SizedBox(height: 7.h),
                                    TextView(
                                      "\$1,900",
                                      style: myTextStyle.font_14w500,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    
                    SizedBox(height: 13.h),
                    Center(
                      child: Container(
                        height: 1,
                        color: MyColors.grayF0F0F0,
                      ),
                    ),
                    SizedBox(height: 13.h),
                    
                    // Total Bill
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
                    
                    SizedBox(height: 13.h),
                    Center(
                      child: Container(
                        height: 1,
                        color: MyColors.grayF0F0F0,
                      ),
                    ),
                    SizedBox(height: 13.h),
                    
                    // Delivery Time
                    TextView(
                      "Delivery Time & Date",
                      style: myTextStyle.font_16ww500.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextView(
                      "12:00PM 12-4-2024",
                      style: myTextStyle.font_16ww500.copyWith(
                        fontWeight: FontWeight.w500,
                        color: MyColors.gray7C7C7C,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}