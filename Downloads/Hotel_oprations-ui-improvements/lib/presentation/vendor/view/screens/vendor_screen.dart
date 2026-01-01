import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/app_drawer.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/presentation/vendor/view/widgets/dispatch_order_tab.dart';
import 'package:kunggy_operational_app/presentation/vendor/view/widgets/price_agreed_tab.dart';
import 'package:kunggy_operational_app/presentation/vendor/view/widgets/price_negotiation_tab.dart';
import 'package:kunggy_operational_app/presentation/vendor/view/widgets/price_quotation_tab.dart';
import 'package:kunggy_operational_app/presentation/vendor/view/widgets/vendor_appbar.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({super.key});

  @override
  State<VendorScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();

  // Function to scroll to the selected tab
  void _scrollToSelectedTab(int index) {
    // Calculate the position that places the selected tab on the left
    double tabWidth = 150.w; // Approximate width of each tab including padding
    double scrollPosition =
        index * (tabWidth + 12.w); // Include padding between tabs

    // Ensure we don't scroll beyond bounds
    scrollPosition = scrollPosition.clamp(
      0,
      _scrollController.position.maxScrollExtent,
    );

    // Animate to the calculated position with slower duration
    _scrollController.animateTo(
      scrollPosition,
      duration: const Duration(
          milliseconds: 1500), // Increased duration for slower scroll
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                const VendorAppbar(),
                SizedBox(height: 32.h),

                // Tab buttons row with proper spacing
                SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  physics:
                      const BouncingScrollPhysics(), // Smooth scrolling physics
                  child: Row(
                    children: List.generate(
                      tabsName.length,
                      (i) => Padding(
                        padding: EdgeInsets.only(
                            right: i != tabsName.length - 1 ? 12.w : 0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            setState(() {
                              _selectedIndex = i;
                            });
                            // Auto scroll when tab is selected
                            _scrollToSelectedTab(i);
                          },
                          child: Container(
                            height: 40.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: _selectedIndex == i
                                  ? MyColors.primaryDark1D1929
                                  : MyColors.greenCDEADE,
                              boxShadow: _selectedIndex == i
                                  ? [
                                      BoxShadow(
                                        color: MyColors.primaryDark1D1929
                                            .withOpacity(0.2),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      )
                                    ]
                                  : null,
                            ),
                            child: Center(
                              child: TextView(
                                tabsName[i],
                                style: myTextStyle.font_14w500.copyWith(
                                  color: _selectedIndex == i
                                      ? MyColors.whiteFFFFFF
                                      : MyColors.dark000000,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 32.h),

                // Content area
                Expanded(
                  child: _selectedIndex == 0
                      ? const PriceQuotationTab()
                      : _selectedIndex == 1
                          ? const PriceNegotiationTab()
                          : _selectedIndex == 2
                              ? const PriceAgreedTab()
                              : const DispatchOrderTab(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

final List<String> tabsName = [
  "Price Quotation",
  "Price Negotiation",
  "Price Agreed",
  "Dispatch Order",
];
