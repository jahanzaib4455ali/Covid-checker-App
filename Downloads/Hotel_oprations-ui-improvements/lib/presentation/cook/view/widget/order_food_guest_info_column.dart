import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/presentation/cook/view/widget/order_food_guest_info_container.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

import '../../../../l10n/app_localizations.dart';



class OrderFoodGuestInfoColumn extends StatelessWidget {
  const OrderFoodGuestInfoColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: MyColors.grayEFEFEF,
        ),
      ),
      child: Column(
        children: [
          OrderFoodGuestInfoContainer(
            text1:AppLocalizations.of(context)?.roomNoLabel ?? "Room no",
            text2: "101",
          ),
          OrderFoodGuestInfoContainer(
            text1:AppLocalizations.of(context)?.orderId ?? "Order id",
            text2: "10098",
          ),
          OrderFoodGuestInfoContainer(
            text1: AppLocalizations.of(context)?.guestName ??"Guest name",
            text2: "Rahul K.",
          ),
          OrderFoodGuestInfoContainer(
            text1:AppLocalizations.of(context)?.orderPrice ?? "Order Price",
            text2: "\$28.00",
          ),
          OrderFoodGuestInfoContainer(
            text1: AppLocalizations.of(context)?.payment ?? "Payment",
            text2: "Visa Card",
            isLast: true,
          ),
        ],
      ),
    );
  }
}
