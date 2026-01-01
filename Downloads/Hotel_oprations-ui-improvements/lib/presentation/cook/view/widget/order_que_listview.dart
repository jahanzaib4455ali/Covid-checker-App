import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/presentation/cook/view/widget/order_food_guest_info_column.dart';

import 'order_food_container.dart';

class OrderQueListView extends StatelessWidget {
  const OrderQueListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, i) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OrderFoodGuestInfoColumn(),
              SizedBox(
                width: 8.w,
              ),
              const Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: OrderFoodContainer(),
                    ),
                    Flexible(
                      child: OrderFoodContainer(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
