import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/my_text_field.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/presentation/vendor/view/screens/order_history_screen.dart';


class OrderHistoryListScreen extends StatefulWidget {
  const OrderHistoryListScreen({super.key});

  @override
  State<OrderHistoryListScreen> createState() => _OrderHistoryListScreenState();
}

class _OrderHistoryListScreenState extends State<OrderHistoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: false,
      isProfile: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(MyIcons.arrowRight),
                ),
                SizedBox(width: 12.w),
                TextView(
                  "Order History",
                  style: myTextStyle.font_20wMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
              radius: BorderRadius.circular(7),
              prefixWidth: 40.w,
              textFieldColor: MyColors.grayF7F7F8,
              isFilled: true,
              borderColor: MyColors.grayD0D5DD,
              margin: EdgeInsets.symmetric(horizontal: 22.w),
              hintText: "Search",
              prefixIcon: SvgPicture.asset(
                MyIcons.search,
                fit: BoxFit.none,
              ),
              trailingWidget: InkWell(
                onTap: () {
                  // Handle tap event here
                },
                borderRadius: BorderRadius.circular(8), // Ensures smooth tap effect
                child: Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: Material(
                    color: Colors.transparent, // Ensures no background interference
                    child:  SvgPicture.asset(
                      MyIcons.searchFilter, // Make sure the image path is correct
                      width: 50.w, // Adjust size as needed
                      height: 50.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 20,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderHistoryScreen(),
                      ),
                    );
                  },
                  child: const OrderHistoryTile(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderHistoryTile extends StatelessWidget {
  const OrderHistoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.grayD0D5DD),
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Handle tile tap
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      "Purchase Order 1",
                      style: myTextStyle.font_16ww500,
                    ),
                    TextView(
                      "12-4-2024  11:30am",
                      style: myTextStyle.font_14w500.copyWith(
                        color: MyColors.gray979797,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      "Order Id: 0123456",
                      style: myTextStyle.font_14w500.copyWith(
                        color: MyColors.gray979797,
                      ),
                    ),
                    Row(
                      children: [
                        TextView(
                          "Order Completed",
                          style: myTextStyle.font_16ww500.copyWith(
                            color: MyColors.primaryDark1D1929,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderHistoryScreen(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: MyColors.primaryDark1D1929,
                            size: 20.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
