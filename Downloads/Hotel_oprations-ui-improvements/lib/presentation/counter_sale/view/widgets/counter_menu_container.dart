import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'counter_sale_food_details.dart';

class CounterMenuContainer extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final bool inCart;
  final int quantity;
  const CounterMenuContainer({super.key, required this.onAdd, required this.onRemove, this.inCart = false, this.quantity = 0});

  @override
  Widget build(BuildContext context) {
    final bool isVeg = true;
    final String badge = 'Best Seller';
    final String name = 'Pizza vegan cheese';
    final int price = 590;
    final int oldPrice = 1180;
    final int discount = 50;
    final String desc = '[Serving for 3 persons]\n12 inches Cheese chicken Pizza and ...';
    final bool couponEligible = false;
    final String image = 'assets/images/pizza.png';

    return InkWell(
      onTap: () {
        showCounterFoodDetailBottomSheet(context, onAddItem: onAdd);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFF2F2F2)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isVeg ? const Color(0xFF00A35E) : Color(0xFFE23D3D),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: isVeg ?  const Color(0xFF00A35E) : Color(0xFFE23D3D),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: badge == 'Best Seller' ? Color(0xFFFFF3E6) : Color(0xFFFFEAEA),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                badge == 'Best Seller' ? Icons.local_fire_department : Icons.recommend,
                                color: badge == 'Best Seller' ? Color(0xFFFF9900) : Color(0xFFE23D3D),
                                size: 14,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                badge,
                                style: TextStyle(
                                  color: badge == 'Best Seller' ? Color(0xFFFF9900) : Color(0xFFE23D3D),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '₹$price.00',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '₹$oldPrice.00',
                          style: const TextStyle(
                            color: Color(0xFFBDBDBD),
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$discount% OFF',
                      style: const TextStyle(
                        color: Color(0xFF00A35E),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      desc,
                      style: const TextStyle(
                        color: Color(0xFF7B7B7B),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    if (!couponEligible)
                      const Text(
                        'Not Eligible For Coupon',
                        style: TextStyle(
                          color: Color(0xFFBDBDBD),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image,
                      height: 140,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: inCart && quantity > 0
                        ? Container(
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Color(0xFF18181B),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 1.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove, color: Colors.white, size: 20),
                                  onPressed: onRemove,
                                  padding: EdgeInsets.zero,
                                ),
                                Container(
                                  width: 28,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '$quantity',
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add, color: Colors.white, size: 20),
                                  onPressed: onAdd,
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 1.5),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: onAdd,
                                borderRadius: BorderRadius.circular(10),
                                child: const Center(
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
