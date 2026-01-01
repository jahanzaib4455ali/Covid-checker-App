import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:kunggy_operational_app/common/widget/common_blur_modal.dart';

import 'order_info.dart';

class OrderFoodDashboardScreen extends StatefulWidget {
  const OrderFoodDashboardScreen({super.key});

  @override
  State<OrderFoodDashboardScreen> createState() =>
      _OrderFoodDashboardScreenState();
}

class _OrderFoodDashboardScreenState extends State<OrderFoodDashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int? expandedIndex;
  Set<String> _selectedStatuses = {};

  final List<Map<String, dynamic>> pendingOrders = [
    {
      'orderId': '10098',
      'guestName': 'Rahul K.',
      'room': 'A-0101',
      'status': 'Accepted',
      'time': '10:10AM',
      'details': {
        'orderTime': '10:00 AM',
        'items': [
          {
            'name': 'Chicken Tika Pizza',
            'portion': 'Medium',
            'qty': 1,
            'price': 10
          },
          {
            'name': 'Chicken Tika Pizza',
            'portion': 'Medium',
            'qty': 2,
            'price': 10
          },
        ],
        'totalPrice': 30.0,
        'gst': 3.0,
        'vat': 3.0,
        'totalAmount': 33.0,
        'note': 'i want you to keep salt light with light chilli.',
        'statusStep': 0,
      },
    },
    // Add more mock orders if needed
    {
      'orderId': '10098',
      'guestName': 'Rahul K.',
      'room': 'A-0101',
      'status': 'Accepted',
      'time': '10:10AM',
      'details': {
        'orderTime': '10:00 AM',
        'items': [
          {
            'name': 'Chicken Tika Pizza',
            'portion': 'Medium',
            'qty': 1,
            'price': 10
          },
        ],
        'totalPrice': 10.0,
        'gst': 1.0,
        'vat': 1.0,
        'totalAmount': 12.0,
        'note': 'No onions.',
        'statusStep': 1,
      },
    },
  ];

  final List<Map<String, dynamic>> completedOrders = [
    {
      'orderId': '10098',
      'guestName': 'Rahul K.',
      'room': 'A-0101',
      'status': 'Accepted',
      'time': '10:10AM',
      'details': {
        'orderTime': '10:00 AM',
        'items': [
          {
            'name': 'Chicken Tika Pizza',
            'portion': 'Medium',
            'qty': 1,
            'price': 10
          },
          {
            'name': 'Chicken Tika Pizza',
            'portion': 'Medium',
            'qty': 2,
            'price': 10
          },
        ],
        'totalPrice': 30.0,
        'gst': 3.0,
        'vat': 3.0,
        'totalAmount': 33.0,
        'note': 'i want you to keep salt light with light chilli.',
        'statusStep': 3,
      },
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: MyColors.grayF7F7F8,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: SvgPicture.asset(MyIcons.arrowRight,
                                width: 15, height: 15),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text('Order Food',
                          style: myTextStyle.font_20wMedium
                              .copyWith(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FoodOrderInfoScreen()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      child: const Text('Take Order',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(top: 1, bottom: 24),
              child: Divider(
                color: Colors.black.withOpacity(0.08),
                thickness: 4,
                height: 1,
              ),
            ),

            TabBar(
              controller: _tabController,
              indicatorColor: Colors.black,
              indicatorWeight: 2.5,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black.withOpacity(0.5),
              labelStyle: myTextStyle.font_18w600,
              unselectedLabelStyle: myTextStyle.font_18w600,
              tabs: const [
                Tab(text: "Pending Order's"),
                Tab(text: "Completed Order's"),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildOrderList(pendingOrders, true),
                  _buildOrderList(completedOrders, false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(List<Map<String, dynamic>> orders, bool isPending) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filter', style: myTextStyle.font_20wMedium),
                InkWell(
                  onTap: () {
                    _showFilterModal();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        MyIcons.searchFilter,
                        fit: BoxFit.none,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ...List.generate(orders.length, (index) {
            final order = orders[index];
            final expanded = expandedIndex == index &&
                _tabController.index == (isPending ? 0 : 1);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 2, top: 8),
                  child: Text(order['time'],
                      style: myTextStyle.font_14w500
                          .copyWith(color: MyColors.gray979797)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final screenWidth = MediaQuery.of(context).size.width;
                      final cardPadding = screenWidth * 0.03;
                      return Stack(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              border: Border.all(color: MyColors.grayD0D5DD),
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: cardPadding, vertical: 14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Order Id
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Order Id',
                                                style: myTextStyle.font_14w500
                                                    .copyWith(
                                                        color: MyColors
                                                            .gray979797)),
                                            const SizedBox(height: 2),
                                            Text(order['orderId'],
                                                style:
                                                    myTextStyle.font_16ww700),
                                          ],
                                        ),
                                      ),
                                      _verticalDivider(),
                                      // Guest Name
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Guest Name',
                                                style: myTextStyle.font_14w500
                                                    .copyWith(
                                                        color: MyColors
                                                            .gray979797)),
                                            const SizedBox(height: 2),
                                            Text(order['guestName'],
                                                style:
                                                    myTextStyle.font_16ww700),
                                          ],
                                        ),
                                      ),
                                      _verticalDivider(),
                                      // Room
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Room',
                                                style: myTextStyle.font_14w500
                                                    .copyWith(
                                                        color: MyColors
                                                            .gray979797)),
                                            const SizedBox(height: 2),
                                            Text(order['room'],
                                                style:
                                                    myTextStyle.font_16ww700),
                                          ],
                                        ),
                                      ),
                                      _verticalDivider(),
                                      // Status
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Status',
                                                style: myTextStyle.font_14w500
                                                    .copyWith(
                                                        color: MyColors
                                                            .gray979797)),
                                            const SizedBox(height: 2),
                                            Text(order['status'],
                                                style:
                                                    myTextStyle.font_16ww700),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (expanded)
                                  _buildOrderDetails(order['details']),
                              ],
                            ),
                          ),
                          // Arrow button on border (right bottom)
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 12, bottom: 4),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (expanded) {
                                        expandedIndex = null;
                                      } else {
                                        expandedIndex = index;
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: MyColors.grayD0D5DD),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.04),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    width: 28,
                                    height: 28,
                                    child: Icon(
                                      expanded
                                          ? Icons.keyboard_arrow_up_rounded
                                          : Icons.keyboard_arrow_down_rounded,
                                      size: 24,
                                      color: MyColors.gray979797,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildOrderDetails(Map<String, dynamic> details) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(14)),
        border: Border(top: BorderSide(color: MyColors.grayD0D5DD)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Only show details, do not repeat info
          Row(
            children: [
              Expanded(
                  child: Text('Item Name',
                      style: myTextStyle.font_16ww400
                          .copyWith(color: MyColors.gray979797))),
              _verticalDivider(),
              Expanded(
                  child: Text('Portion Size',
                      style: myTextStyle.font_16ww400
                          .copyWith(color: MyColors.gray979797))),
              _verticalDivider(),
              Expanded(
                  child: Text('Quantity & Price',
                      style: myTextStyle.font_16ww400
                          .copyWith(color: MyColors.gray979797))),
              _verticalDivider(),
              Expanded(
                  child: Text('Total Price',
                      style: myTextStyle.font_16ww400
                          .copyWith(color: MyColors.gray979797))),
            ],
          ),
          ...details['items'].map<Widget>((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 8.0), // space between rows (optional)
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(item['name'], style: myTextStyle.font_16ww700),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(item['portion'],
                          style: myTextStyle.font_16ww700),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('${item['qty']}×${item['price']}',
                          style: myTextStyle.font_16ww700),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text('${item['qty'] * item['price']}',
                          style: myTextStyle.font_16ww700),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          const SizedBox(height: 8),
          _buildAmountRow('Total Price', details['totalPrice']),
          _buildAmountRow('GST Tax', details['gst']),
          _buildAmountRow('VAT Tax', details['vat']),
          _buildAmountRow('Total Amount', details['totalAmount'], isBold: true),
          const SizedBox(height: 8),
          Text('Note',
              style: myTextStyle.font_16ww400
                  .copyWith(color: MyColors.gray979797)),
          Text(details['note'], style: myTextStyle.font_16ww700),
          const SizedBox(height: 8),
          _buildOrderStatus(details['statusStep']),
        ],
      ),
    );
  }

  Widget _buildAmountRow(String label, double value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style:
                  isBold ? myTextStyle.font_16ww700 : myTextStyle.font_16ww400),
          Text('${value.toStringAsFixed(2)}',
              style:
                  isBold ? myTextStyle.font_16ww700 : myTextStyle.font_16ww400),
        ],
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(
      width: 1,
      height: 25, // shorter length
      color: Colors.grey.shade300,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Widget _buildOrderStatus(int step) {
    final List<String> steps = [
      'Order Accepted',
      'Order Prepairing',
      'Order Ready to Deliver',
      'Order Completed',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        Center(
          child: Text('Order Status', style: myTextStyle.font_18w600),
        ),
        const SizedBox(height: 9),
        // Add this package in pubspec.yaml

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(steps.length * 2 - 1, (i) {
            if (i.isEven) {
              // Circle + Label
              int index = i ~/ 2;
              bool isActive = index <= step;

              return Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // Step Circle
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isActive ? Colors.black : Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: isActive
                          ? const Icon(Icons.check,
                              color: Colors.white, size: 16)
                          : null,
                    ),
                    const SizedBox(height: 6),
                    // Step Label
                    Text(
                      steps[index],
                      style: myTextStyle.font_12w400.copyWith(
                        color: isActive ? Colors.black : MyColors.gray979797,
                        fontWeight:
                            isActive ? FontWeight.w600 : FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            } else {
              // Dotted line between circles
              return Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      top: 12), // aligns with circle vertically
                  child: const DottedLine(
                    dashLength: 4,
                    dashGapLength: 3,
                    lineThickness: 2,
                    dashColor: Colors.black,
                  ),
                ),
              );
            }
          }),
        )
      ],
    );
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return CommonBlurModal(
          onClose: () => Navigator.pop(context),
          child: _buildFilterModalContent(),
        );
      },
    );
  }

  Widget _buildFilterModalContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter',
            style: myTextStyle.font_20wMedium,
          ),
          const SizedBox(height: 16),
          // Search Bar
          Container(
            decoration: BoxDecoration(
              color: MyColors.grayF7F7F8,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search order id /guest name',
                hintStyle: myTextStyle.font_16ww400.copyWith(color: MyColors.gray979797),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: MyColors.gray979797),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildStatusSection('Filter by Status', ['Accepted', 'Preparing', 'Ready to Deliver', 'Completed']),
          const SizedBox(height: 24),
          _buildStatusSection('Status', ['Accepted', 'Preparing', 'Ready to Deliver', 'Completed']),
          const SizedBox(height: 24),
          _buildStatusSection('Status', ['Accepted', 'Preparing']),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Handle Clear All
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text('Clear All', style: myTextStyle.font_18w600.copyWith(color: Colors.red)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Apply
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text('Apply', style: myTextStyle.font_18w600.copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSection(String title, List<String> statuses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: myTextStyle.font_18w600),
        const SizedBox(height: 12),
        // Modified to display two items per row with equal width and height
        Column(
          children: List.generate((statuses.length / 2).ceil(), (rowIndex) {
            int startIndex = rowIndex * 2;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0), // Spacing between rows
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatusChip(
                      statuses[startIndex],
                      _selectedStatuses.contains(statuses[startIndex]), // isSelected
                      () {
                        setState(() {
                          if (_selectedStatuses.contains(statuses[startIndex])) {
                            _selectedStatuses.remove(statuses[startIndex]);
                          } else {
                            _selectedStatuses.add(statuses[startIndex]);
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8.0), // Spacing between chips in a row
                  if (startIndex + 1 < statuses.length)
                    Expanded(
                      child: _buildStatusChip(
                        statuses[startIndex + 1],
                        _selectedStatuses.contains(statuses[startIndex + 1]), // isSelected
                        () {
                          setState(() {
                            if (_selectedStatuses.contains(statuses[startIndex + 1])) {
                              _selectedStatuses.remove(statuses[startIndex + 1]);
                            } else {
                              _selectedStatuses.add(statuses[startIndex + 1]);
                            }
                          });
                        },
                      ),
                    )
                  else
                    const Expanded(child: SizedBox.shrink()), // Empty widget to maintain spacing/alignment for odd number of items
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildStatusChip(String status, bool isSelected, VoidCallback onTap) {
    // This is a basic chip, you might want to add state management for selection
    return InkWell( // Use InkWell for tap feedback
      onTap: onTap,
      child: Container(
        height: 48.0, // Fixed height for consistent sizing
        alignment: Alignment.center, // Center the text within the container
        padding: const EdgeInsets.symmetric(horizontal: 16), // Vertical padding handled by fixed height
        decoration: BoxDecoration(
          color: isSelected ? MyColors.primaryDark1D1929 : Colors.white, // Selected color from food_menu.dart's buildOutlinedIconButton
          border: Border.all(color: isSelected ? Colors.transparent : MyColors.grayD0D5DD), // Border behavior when selected
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(status, 
            style: myTextStyle.font_16ww400.copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
      ),
    );
  }
}
