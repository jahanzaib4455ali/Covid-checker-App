import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/common/widget/my_buttons/my_elevated_button.dart';
import 'dart:ui';

import '../screens/cart_view.dart';


void showFoodDetailBottomSheet(BuildContext context, {VoidCallback? onAddItem}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return FoodDetailBottomSheet(onAddItem: onAddItem);
    },
  );
}

class FoodDetailBottomSheet extends StatefulWidget {
  final VoidCallback? onAddItem;
  const FoodDetailBottomSheet({Key? key, this.onAddItem}) : super(key: key);

  @override
  FoodDetailBottomSheetState createState() => FoodDetailBottomSheetState();
}

class FoodDetailBottomSheetState extends State<FoodDetailBottomSheet> {
  String _selectedSize = "Large";
  int _quantity = 1;
  final TextEditingController _requestController = TextEditingController();

  final Map<String, int> _prices = {
    'Small': 290,
    'Medium': 490,
    'Large': 690,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // White popup content
          Container(
        decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
                const SizedBox(height: 32), // Space for the floating X
                // Badge and title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFEAEA),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                'assets/icons/nonVeg.svg',
                                width: 18,
                                height: 18
                            ),
                            const SizedBox(width: 4),
                            const Text('Recommended', style: TextStyle( color: MyColors.yellowF06F1E, fontWeight: FontWeight.w600, fontSize: 13)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Food name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Chicken Tikka Pizza',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('[Serving for 3 persons]', style: TextStyle(color: Color(0xFF7B7B7B), fontSize: 15, fontWeight: FontWeight.w500)),
                        SizedBox(height: 2),
                        Text('12 inches Cheese chicken Pizza with deep garlic mayo sauce with fresh.', style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                // Variation card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
              decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFFE0E0E0)),
              ),
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Variation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Color(0xFF18181B),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Text('Required', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16, 2, 16, 0),
                          child: Text('Select one', style: TextStyle(color: Color(0xFF7B7B7B), fontSize: 14)),
                        ),
                        RadioListTile<String>(
                          value: 'Small',
                          groupValue: _selectedSize,
                          onChanged: (value) => setState(() => _selectedSize = value!),
                          title: const Text('Small (8Inch)', style: TextStyle(fontSize: 16)),
                          secondary: const Text('₹290', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                          activeColor: Color(0xFF18181B),
                        ),
                        RadioListTile<String>(
                          value: 'Medium',
                          groupValue: _selectedSize,
                          onChanged: (value) => setState(() => _selectedSize = value!),
                          title: const Text('Medium (12Inch)', style: TextStyle(fontSize: 16)),
                          secondary: const Text('₹490', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                          activeColor: Color(0xFF18181B),
                        ),
                        RadioListTile<String>(
                          value: 'Large',
                          groupValue: _selectedSize,
                          onChanged: (value) => setState(() => _selectedSize = value!),
                          title: const Text('Large (16Inch)', style: TextStyle(fontSize: 16)),
                          secondary: const Text('₹690', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                          activeColor: Color(0xFF18181B),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                // Cooking request
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Add a Cooking request (optional)', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFFE0E0E0)),
                        ),
                        child: TextField(
                          controller: _requestController,
                          style: const TextStyle(fontSize: 15),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            hintText: "e.g. Don't make it too spicy",
                            hintStyle: TextStyle(color: Color(0xFFBDBDBD), fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                // Quantity selector and Add button
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE0E0E0)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: Color(0xFF18181B)),
                              onPressed: () {
                                setState(() {
                                  if (_quantity > 1) _quantity--;
                                });
                              },
                            ),
                            Text('$_quantity', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                            IconButton(
                              icon: const Icon(Icons.add, color: Color(0xFF18181B)),
                              onPressed: () {
                          setState(() {
                                  _quantity++;
                          });
                        },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF18181B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              // Ensure the cart count updates in the menu list when adding from details
                              widget.onAddItem?.call();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CartScreen()),
                              );
                            },
                            child: Text(
                              'Add item ₹${_prices[_selectedSize]! * _quantity}',
                              style: const TextStyle(
                                color: Colors.white,
                            fontWeight: FontWeight.w600,
                                fontSize: 18,
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
          // Floating close button
          Positioned(
            top: -60,
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 28, ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
