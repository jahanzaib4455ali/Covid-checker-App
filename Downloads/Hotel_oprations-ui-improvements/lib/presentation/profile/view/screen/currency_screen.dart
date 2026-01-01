import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  String selectedCurrency = "USD (\$)";  // Default currency selection

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
                  "Choose Currency",
                  style: myTextStyle.font_16ww500.copyWith(
                    fontSize: 24.h,
                    color: MyColors.dark07090D,
                  ),
                ),
                SizedBox(height: 6.h),
                TextView(
                  "Please select your currency",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 16.h,
                    color: const Color(0xff847C7C),
                  ),
                ),
                SizedBox(height: 40.h),
                Column(
                  children: currencies.map((currency) {
                    return InkWell(
                      splashColor: MyColors.transparent,
                      highlightColor: MyColors.transparent,
                      onTap: () {
                        setState(() {
                          selectedCurrency = currency;
                        });
                      },
                      child: CurrencyContainer(
                        currency: currency,
                        isSelected: currency == selectedCurrency,
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurrencyContainer extends StatelessWidget {
  const CurrencyContainer({
    super.key,
    required this.isSelected,
    required this.currency,
  });

  final bool isSelected;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
      margin: EdgeInsets.only(bottom: 16.h),
      height: 60.h,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? MyColors.primaryDark1D1929 : const Color(0xffBBE2EC),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                "Currency",
                style: myTextStyle.font_12w500.copyWith(
                  color: MyColors.primaryDark1D1929,
                ),
              ),
              TextView(
                currency,
                style: myTextStyle.font_12w500.copyWith(
                  color: MyColors.dark07090D,
                  fontSize: 14.h,
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            MyIcons.check,
            color: isSelected ? MyColors.primaryDark1D1929 : MyColors.whiteFFFFFF,
          ),
        ],
      ),
    );
  }
}

// ✅ List of Currencies to Choose From
final List<String> currencies = [
  "USD (\$)",
  "INR (₹)",
  "EUR (€)",
  "GBP (£)",
  "PKR (₨)",
];
