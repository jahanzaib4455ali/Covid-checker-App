import 'package:flutter/material.dart';
import '../../../../theme/my_colors.dart';
import 'counter_sale_food_menu.dart';

class CounterSaleOrderInfoScreen extends StatefulWidget {
  const CounterSaleOrderInfoScreen({super.key});

  @override
  State<CounterSaleOrderInfoScreen> createState() => CounterSaleOrderInfoScreenState();
}

class CounterSaleOrderInfoScreenState extends State<CounterSaleOrderInfoScreen> {
  String selectedType = 'Table';
  String selectedTable = 'A-102';
  final List<String> tables = ['A-102', 'A-103', 'A-104'];
  final TextEditingController orderedByController = TextEditingController(text: 'Rahul Kumar');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.grayFFEFEFF4,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Take Order',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              child: Divider(
                color: Colors.black.withOpacity(0.08),
                thickness: 1,
                height: 1,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Flexible(
            //         child: Text(
            //           'Food Order For',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 18,
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(width: 16),
            //       Flexible(
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(12),
            //             border: Border.all(color: const Color(0xFFD9D9D9), width: 2),
            //           ),
            //           child: Row(
            //             children: [
            //               Expanded(
            //                 child: GestureDetector(
            //                   onTap: () => setState(() => selectedType = 'Room'),
            //                   child: Container(
            //                     padding: const EdgeInsets.symmetric(vertical: 10),
            //                     decoration: BoxDecoration(
            //                       color: selectedType == 'Room' ? Colors.black : Colors.white,
            //                       borderRadius: const BorderRadius.only(
            //                         topLeft: Radius.circular(10),
            //                         bottomLeft: Radius.circular(10),
            //                       ),
            //                     ),
            //                     alignment: Alignment.center,
            //                     child: Text(
            //                       'Room',
            //                       style: TextStyle(
            //                         color: selectedType == 'Room' ? Colors.white : Colors.black,
            //                         fontWeight: FontWeight.w600,
            //                         fontSize: 16,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               Expanded(
            //                 child: GestureDetector(
            //                   onTap: () => setState(() => selectedType = 'Table'),
            //                   child: Container(
            //                     padding: const EdgeInsets.symmetric(vertical: 10),
            //                     decoration: BoxDecoration(
            //                       color: selectedType == 'Table' ? Colors.black : Colors.white,
            //                       borderRadius: const BorderRadius.only(
            //                         topRight: Radius.circular(10),
            //                         bottomRight: Radius.circular(10),
            //                       ),
            //                     ),
            //                     alignment: Alignment.center,
            //                     child: Text(
            //                       'Table',
            //                       style: TextStyle(
            //                         color: selectedType == 'Table' ? Colors.white : Colors.black,
            //                         fontWeight: FontWeight.w600,
            //                         fontSize: 16,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Customer Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFD9D9D9)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: orderedByController,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Rahul Kumar',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF18181B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CounterSaleFoodMenuScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

