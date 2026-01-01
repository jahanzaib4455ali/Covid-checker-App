import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/presentation/vendor/view/widgets/hotel_response_box.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class PriceAgreedTab extends StatelessWidget {
  const PriceAgreedTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          padding: EdgeInsets.only(left: 20.w),
          "Price Agreed",
          style: myTextStyle.font_20wMedium.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16.h,
            color: MyColors.gray7F7F7F,
          ),
        ),
        SizedBox(
          height: 33.h,
        ),
        const Expanded(
          child: HotelResponse(
            isPriceAgreed: true,
          ),
        ),
      ],
    ));
  }
}
