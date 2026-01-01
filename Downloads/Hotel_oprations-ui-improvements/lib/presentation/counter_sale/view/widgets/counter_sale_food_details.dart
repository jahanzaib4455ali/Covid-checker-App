import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/presentation/counter_sale/view/screens/counter_sale_cart_view.dart';

void showCounterFoodDetailBottomSheet(BuildContext context, {VoidCallback? onAddItem}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return CounterFoodDetailBottomSheet(onAddItem: onAddItem);
    },
  );
}

class CounterFoodDetailBottomSheet extends StatefulWidget {
  final VoidCallback? onAddItem;
  const CounterFoodDetailBottomSheet({super.key, this.onAddItem});

  @override
  State<CounterFoodDetailBottomSheet> createState() => _CounterFoodDetailBottomSheetState();
}

class _CounterFoodDetailBottomSheetState extends State<CounterFoodDetailBottomSheet> {
  String _selectedSize = "Large";
  int _quantity = 1;

  final Map<String, int> _prices = {
    'Small': 290,
    'Medium': 490,
    'Large': 690,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEAEA),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/nonVeg.svg', width: 18, height: 18),
                            const SizedBox(width: 4),
                            const Text('Recommended', style: TextStyle(color: Color(0xFFF06F1E), fontWeight: FontWeight.w600, fontSize: 13)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Chicken Tikka Pizza', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Text('Variation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE0E0E0)),
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
                              backgroundColor: const Color(0xFF18181B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              widget.onAddItem?.call();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CounterSaleCartScreen()),
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
          Positioned(
            top: -60,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 28),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
