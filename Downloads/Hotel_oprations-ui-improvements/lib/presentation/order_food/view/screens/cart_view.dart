import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/presentation/order_food/view/widgets/food_details.dart';

import '../../../../l10n/app_localizations.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Mock cart data to match screenshot
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Pizza vegan cheese',
      'subtitle': '12 Inch',
      'price': 490,
      'oldPrice': null,
      'isVeg': true,
      'couponEligible': true,
    },
    {
      'name': 'Butter Chicken SP',
      'subtitle': 'Half (4piece)',
      'price': 590,
      'oldPrice': 980,
      'isVeg': false,
      'couponEligible': false,
    },
    {
      'name': 'Veg Fried Rice',
      'subtitle': '1 Plate',
      'price': 390,
      'oldPrice': null,
      'isVeg': true,
      'couponEligible': true,
    },
  ];
  List<int> quantities = [1, 1, 1];
  bool showNote = false;
  TextEditingController noteController = TextEditingController();

  int getTotalAmount() {
    int total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      final price = cartItems[i]['price'] as num;
      final quantity = quantities[i] as int;
      total += (price * quantity).toInt();  // Cast the result explicitly
    }
    return total;
  }



  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isRTL = Localizations.localeOf(context).languageCode == 'ar' ||
        Localizations.localeOf(context).languageCode == 'ur';
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Food Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                itemCount: cartItems.length,
                separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFF2F2F2)),
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Veg/Non-veg icon
                        Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: item['isVeg'] ? Color(0xFF00A35E) : Color(0xFFE23D3D),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: item['isVeg'] ? Color(0xFF00A35E) : Color(0xFFE23D3D),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                    item['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    item['subtitle'],
                                style: const TextStyle(
                                  fontSize: 14,
                                      color: Color(0xFF7B7B7B),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text(
                                          'Edit',
                                          style: TextStyle(
                                            color: Color(0xFFE23D3D),
                                  fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Icon(Icons.arrow_forward_ios_rounded, size: 12, color: Color(0xFFE23D3D)),
                                      ],
                                    ),
                                  ),
                                  if (!item['couponEligible']) ...[
                                    const SizedBox(height: 2),
                                    const Text(
                                      'Not Eligible For Coupon',
                                      style: TextStyle(
                                        color: Color(0xFFBDBDBD),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            // Quantity selector and price
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF18181B),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                children: [
                                  IconButton(
                                        icon: const Icon(Icons.remove, color: Colors.white, size: 18),
                                    onPressed: () {
                                      if (quantities[index] > 1) {
                                        setState(() => quantities[index]--);
                                      }
                                    },
                                        constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                                        padding: EdgeInsets.zero,
                                      ),
                                      Container(
                                        width: 28,
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${quantities[index]}',
                                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                                        ),
                                      ),
                                  IconButton(
                                        icon: const Icon(Icons.add, color: Colors.white, size: 18),
                                    onPressed: () {
                                      setState(() => quantities[index]++);
                                    },
                                        constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                                        padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    if (item['oldPrice'] != null)
                        Text(
                                        '₹${item['oldPrice']}',
                          style: const TextStyle(
                                          color: Color(0xFFBDBDBD),
                                          fontSize: 15,
                                          decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w500,
                          ),
                                      ),
                                    if (item['oldPrice'] != null)
                                      const SizedBox(width: 6),
                                    Text(
                                      '₹${item['price']}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Add items
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 8, bottom: 0),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Icon(Icons.add, color: Color(0xFFE23D3D)),
                    SizedBox(width: 4),
                    Text(
                      'Add items',
                      style: TextStyle(
                        color: Color(0xFFE23D3D),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Add a note
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OutlinedButton(
                    onPressed: () => setState(() => showNote = !showNote),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFBDBDBD)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Add a note',
                        style: TextStyle(
                          color: Color(0xFF18181B),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  if (showNote)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: TextField(
                        controller: noteController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Write Note........',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFF2F2F2)),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                    ),
                ],
              ),
            ),
                  // Cancellation Policy
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const Icon(Icons.shield_outlined, color: Color(0xFF18181B)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          const Text(
                            'Cancellation Policy',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                                  fontSize: 16,
                              color: Color(0xFF18181B),
                                ),
                              ),
                              const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              text: 'An order cancellation policy provides security to your business in the event that your customer cancels an order. You may reasonably charge a cancellation. ',
                              style: const TextStyle(
                                color: Color(0xFF7B7B7B),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: 'read more',
                                  style: const TextStyle(
                                    color: Color(0xFF18181B),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ],
                ),
              ),
            ),

            // Bottom bar
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x11000000),
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Payment info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.payments_outlined, color: Color(0xFF18181B), size: 18),
                            SizedBox(width: 6),
                            Text(
                              'PAY USING',
                              style: TextStyle(
                                color: Color(0xFF7B7B7B),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF7B7B7B), size: 18),
                          ],
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Cash on delivery',
                          style: TextStyle(
                            color: Color(0xFF18181B),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Place order button
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF18181B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Price and Total
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '₹${getTotalAmount().toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Row(

                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Place Order',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 14),
                                ],
                              ),
                            ],
                          ),
                          // Place Order text + arrow

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )

            // LayoutBuilder(
            //   builder: (context, constraints) {
            //     return Container(
            //       width: double.infinity,
            //       decoration: const BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(24),
            //           bottomRight: Radius.circular(24),
            //         ),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Color(0x11000000),
            //             blurRadius: 8,
            //             offset: Offset(0, -2),
            //           ),
            //         ],
            //       ),
            //       padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            //       child: Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           // Pay using column
            //           Expanded(
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Row(
            //                   children: const [
            //                     Icon(Icons.payments_outlined, color: Color(0xFF18181B), size: 18),
            //                     SizedBox(width: 6),
            //                     Text(
            //                       'PAY USING',
            //                       style: TextStyle(
            //                         color: Color(0xFF7B7B7B),
            //                         fontSize: 12,
            //                         fontWeight: FontWeight.w500,
            //                       ),
            //                     ),
            //                     Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF7B7B7B), size: 18),
            //                   ],
            //                 ),
            //                 const SizedBox(height: 2),
            //                 const Text(
            //                   'Cash on delivery',
            //                   style: TextStyle(
            //                     color: Color(0xFF18181B),
            //                     fontWeight: FontWeight.w600,
            //                     fontSize: 15,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //
            //           // Place Order button (responsive)
            //           Expanded(
            //             child: Container(
            //               constraints: const BoxConstraints(minWidth: 160),
            //               decoration: BoxDecoration(
            //                 color: const Color(0xFF18181B),
            //                 borderRadius: BorderRadius.circular(12),
            //               ),
            //               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            //               child: FittedBox(
            //                 fit: BoxFit.contain,
            //                 alignment: Alignment.centerRight,
            //                 child: Row(
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   children: [
            //                     // Price and Total
            //                     Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Text(
            //                           '₹${getTotalAmount().toStringAsFixed(2)}',
            //                           style: const TextStyle(
            //                             color: Colors.white,
            //                             fontWeight: FontWeight.w600,
            //                             fontSize: 16,
            //                           ),
            //                         ),
            //                         Text(
            //                           'Total',
            //                           style: TextStyle(
            //                             color: Colors.white.withOpacity(0.7),
            //                             fontSize: 12,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     const SizedBox(width: 16),
            //                     // Place Order text
            //                     const Text(
            //                       'Place Order',
            //                       style: TextStyle(
            //                         color: Colors.white,
            //                         fontWeight: FontWeight.w600,
            //                         fontSize: 15,
            //                       ),
            //                     ),
            //                     const SizedBox(width: 8),
            //                     // Arrow icon
            //                     const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 18),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // )

          ],
        ),
      ),
    );
  }
}
