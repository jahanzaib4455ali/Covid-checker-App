import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/presentation/order_food/view/screens/cart_view.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';


import '../../../../l10n/app_localizations.dart';

// Add ShowCartPopup widget
class ShowCartPopup extends StatelessWidget {
  final VoidCallback? onClose;

  const ShowCartPopup({Key? key, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/images/pizza.png", height: 40, width: 40),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( "Pizza", style: myTextStyle.font_16ww400),
                  TextView(
                    l10n.foodItemCount,
                    style: myTextStyle.font_12w400,
                  ),
                ],
              ),
            ],
          ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: MyColors.primaryDark1D1929,
          //     foregroundColor: Colors.white,
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const CartScreen()),
          //     );
          //   },
          //   child: const Text("View Cart"),
          // ),
          InkWell(
            onTap: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartScreen()),
                      );
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 23),
              height: 42,
              // width: 87,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: MyColors.primaryDark1D1929,
              ),
              child: TextView(
                    l10n.viewCart,
                style: myTextStyle.font_14w500.copyWith(
                  fontWeight: FontWeight.w600,
                  color: MyColors.whiteFFFFFF,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
