import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/presentation/cook/view/widget/order_que_listview.dart';
import 'package:kunggy_operational_app/presentation/house_keeping/view/screen/task_screen.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

import '../../../../l10n/app_localizations.dart';

class FoodOrderScreen extends StatefulWidget {
  const FoodOrderScreen({super.key});

  @override
  State<FoodOrderScreen> createState() => _FoodOrderScreenState();
}

class _FoodOrderScreenState extends State<FoodOrderScreen> {
  int selectedIndex = 1;
  void scrollToIndex(int index) {
    // Width of each button + spacing
    double itemWidth = 100.w; // Adjust based on actual button width
    double offset = index * (itemWidth + 12.w);

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }


  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isRTL = Localizations.localeOf(context).languageCode == 'ar' ||
        Localizations.localeOf(context).languageCode == 'ur';
    return GeneralScaffold(
      isBackButton: false,
      isProfile: false,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32.h,
            ),
            SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  buildTabButton(
                    title: AppLocalizations.of(context)?.ordersQue ?? "Orders Que",
                    isSelected: selectedIndex == 1,
                    onTap: () {
                      setState(() => selectedIndex = 1);
                      scrollToIndex(0);
                    },
                  ),
                  SizedBox(width: 12.w),
                  buildTabButton(
                    title: AppLocalizations.of(context)?.orderPreparing ?? "Order Preparing",
                    isSelected: selectedIndex == 2,
                    onTap: () {
                      setState(() => selectedIndex = 2);
                      scrollToIndex(1);
                    },
                  ),
                  SizedBox(width: 12.w),
                  buildTabButton(
                    title: AppLocalizations.of(context)?.orderCompleted ?? "Order Completed",
                    isSelected: selectedIndex == 3,
                    onTap: () {
                      setState(() => selectedIndex = 3);
                      scrollToIndex(2);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 23.h,
            ),
            if (selectedIndex == 1) const OrderQueTab(),
            if (selectedIndex == 2) const OrderPrepairingTab(),
            if (selectedIndex == 3) const OrderCompletedTab(),
          ],
        ),
      ),
    );
  }
  final ScrollController _scrollController = ScrollController();
  Widget buildTabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 45.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected
              ? MyColors.primaryDark1D1929
              : MyColors.greenCDEADE,
        ),
        child: TextView(
          title,
          style: myTextStyle.font_14w500.copyWith(
            fontSize: 14.sp,
            color: isSelected
                ? MyColors.whiteFFFFFF
                : MyColors.dark242424,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}


class OrderCompletedTab extends StatefulWidget {
  const OrderCompletedTab({
    super.key,
  });

  @override
  State<OrderCompletedTab> createState() => _OrderCompletedTabState();
}

class _OrderCompletedTabState extends State<OrderCompletedTab> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: Column(
          children: [
            Row(
              children: [
                // Grouped left-side buttons
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 34.h,
                        width: 93.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: selectedIndex == 1
                              ? MyColors.primaryDark1D1929
                              : MyColors.greenCDEADE,
                        ),
                        child: TextView(
                          AppLocalizations.of(context)?.today ??
                          "Today",
                          style: myTextStyle.font_14w500.copyWith(
                            color: selectedIndex == 1
                                ? MyColors.whiteFFFFFF
                                : MyColors.dark242424,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 34.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: selectedIndex == 2
                              ? MyColors.primaryDark1D1929
                              : MyColors.greenCDEADE,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: TextView(
                            AppLocalizations.of(context)?.yesterday ??
                            "Yesterday",
                            style: myTextStyle.font_14w500.copyWith(
                              color: selectedIndex == 2
                                  ? MyColors.whiteFFFFFF
                                  : MyColors.dark242424,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Spacer pushes the next widget to the end
                Spacer(),

                // Optional right-aligned button
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 34.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: selectedIndex == 3
                          ? MyColors.primaryDark1D1929
                          : MyColors.greenCDEADE,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextView(
                        AppLocalizations.of(context)?.all ??
                        "All",
                        style: myTextStyle.font_14w500.copyWith(
                          color: selectedIndex == 3
                              ? MyColors.whiteFFFFFF
                              : MyColors.dark242424,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 34.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: MyColors.grayE5E5E5,
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(MyIcons.calendar),
                  SizedBox(
                    width: 8.w,
                  ),
                  TextView(
                    "22-02-2023",
                    style: myTextStyle.font_14w400
                        .copyWith(color: MyColors.dark18181B),
                  ),
                  const Spacer(),
                  SvgPicture.asset(MyIcons.arrowDrop),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 15.h),
                    padding: EdgeInsets.only(
                        left: 13.w, right: 12.w, top: 12.h, bottom: 14.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: MyColors.grayD0D5DD,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              "Chicken Tikka Pizza",
                              style: myTextStyle.font_16ww400.copyWith(
                                fontWeight: FontWeight.w600,
                                color: MyColors.dark242424,
                              ),
                            ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40.h,
                                    width: 122.w,
                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: MyColors.primaryDark1D1929
                                          .withOpacity(0.07),
                                      border: Border.all(
                                        color: MyColors.primaryDark1D1929,
                                      ),
                                    ),
                                    child: Center(
                                      child: TextView(
                                        "Completed",
                                        style: myTextStyle.font_14w500.copyWith(
                                          color: MyColors.primaryDark1D1929,
                                          fontSize: 14.h,
                                          fontWeight: FontWeight.w600,
                                          // textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextView(
                                maxLine: 4,
                                "Lorem ipsum dolor sit amet, consect Sed id enim semer, vulputate.",
                                style: myTextStyle.font_12w400.copyWith(
                                  fontSize: 17.h,
                                  color: MyColors.gray979797,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 80.w,
                            ),
                            Column(
                              children: [
                                TextView(
                                  AppLocalizations.of(context)?.rating ??
                                  "Rating",
                                  style: myTextStyle.font_12w400.copyWith(
                                    color: MyColors.gray979797,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1.5,
                                      color: MyColors.primaryDark1D1929,
                                    ),
                                  ),
                                  child: TextView(
                                    "4.1",
                                    style: myTextStyle.font_12w500.copyWith(
                                      color: MyColors.primaryDark1D1929,
                                      fontSize: 17.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Container(
                          height: 1,
                          color: MyColors.grayF0F0F0,
                          width: 209.w,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Wrap(
                          spacing: 15.w,
                          runSpacing: 10.h,
                          children: [
                            RichText(
                              text: TextSpan(

                                  text: AppLocalizations.of(context)?.orderTime ??
                                      "Order Time: ",
                                  style: myTextStyle.font_12w400.copyWith(
                                    fontSize: 15.h,
                                    color: MyColors.gray979797,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "10:31 AM",
                                      style: myTextStyle.font_12w400.copyWith(
                                        fontSize: 15.h,
                                      ),
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(

                                  text: AppLocalizations.of(context)?.quantity ?? "Quantity: ",
                                  style: myTextStyle.font_12w400.copyWith(
                                    fontSize: 17.h,
                                    color: MyColors.gray979797,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "1",
                                      style: myTextStyle.font_12w400.copyWith(
                                        fontSize: 17.h,
                                      ),
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: AppLocalizations.of(context)?.guestName ?? "Guest Name: ",
                                  style: myTextStyle.font_12w400.copyWith(
                                    fontSize: 17.h,
                                    color: MyColors.gray979797,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Rahul K.",
                                      style: myTextStyle.font_12w400.copyWith(
                                        fontSize: 17.h,
                                      ),
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: AppLocalizations.of(context)?.roomNoLabel ?? "Room No:  ",
                                  style: myTextStyle.font_12w400.copyWith(
                                    fontSize: 17.h,
                                    color: MyColors.gray979797,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "101",
                                      style: myTextStyle.font_12w400.copyWith(
                                        fontSize: 17.h,
                                      ),
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: AppLocalizations.of(context)?.orderSince ?? "Order Since : ",
                                  style: myTextStyle.font_12w400.copyWith(
                                    fontSize: 17.h,
                                    color: MyColors.gray979797,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Min 30",
                                      style: myTextStyle.font_12w400.copyWith(
                                        fontSize: 17.h,
                                      ),
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: AppLocalizations.of(context)?.orderId ?? "Order ID: ",
                                  style: myTextStyle.font_12w400.copyWith(
                                    fontSize: 17.h,
                                    color: MyColors.gray979797,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "10098",
                                      style: myTextStyle.font_12w400.copyWith(
                                        fontSize: 17.h,
                                      ),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Container(
                          height: 1,
                          color: MyColors.grayF0F0F0,
                          width: 209.w,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              AppLocalizations.of(context)?.guestReview ??
                              "Guest Review:",
                              style: myTextStyle.font_12w400.copyWith(
                                color: MyColors.gray979797,
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            TextView(
                              maxLine: 1,
                              overflow: TextOverflow.ellipsis,
                              "Rahul Kumar: The Pizza was very well cooked.",
                              style: myTextStyle.font_12w500.copyWith(
                                fontSize: 13.h,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderQueTab extends StatefulWidget {
  const OrderQueTab({
    super.key,
  });

  @override
  State<OrderQueTab> createState() => _OrderQueTabState();
}

class _OrderQueTabState extends State<OrderQueTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            padding: EdgeInsets.only(left: 21.w),
            AppLocalizations.of(context)?.foodOrders ??
            "Food Orders",
            style: myTextStyle.font_20wMedium.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: TabBar(
              controller: tabController,
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              dividerColor: MyColors.greenCDEADE,
              dividerHeight: 2,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: MyColors.primaryDark1D1929,
              unselectedLabelColor: MyColors.dark242424,
              labelColor: MyColors.primaryDark1D1929,
              labelStyle: myTextStyle.font_14w500.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16.h,
              ),
              unselectedLabelStyle: myTextStyle.font_16ww400,
              tabs:  [
                Tab(text: AppLocalizations.of(context)?.allItems ?? "All Items"),
                Tab(text:AppLocalizations.of(context)?.roti ?? "Roti"),
                Tab(text: AppLocalizations.of(context)?.chinese ?? "Chinese"),
                Tab(text: AppLocalizations.of(context)?.indian ?? "Indian"),
                Tab(text: AppLocalizations.of(context)?.thai ?? "Thai"),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                OrderQueListView(),
                OrderQueListView(),
                OrderQueListView(),
                OrderQueListView(),
                OrderQueListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderPrepairingTab extends StatefulWidget {
  const OrderPrepairingTab({
    super.key,
  });

  @override
  State<OrderPrepairingTab> createState() => _OrderPrepairingTabState();
}

class _OrderPrepairingTabState extends State<OrderPrepairingTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: TabBar(
              controller: tabController,
              tabAlignment: TabAlignment.fill,
              dividerColor: MyColors.greenCDEADE,
              dividerHeight: 2,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: MyColors.primaryDark1D1929,
              unselectedLabelColor: MyColors.dark242424,
              labelColor: MyColors.primaryDark1D1929,
              labelStyle: myTextStyle.font_14w500.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18.h,
              ),
              unselectedLabelStyle: myTextStyle.font_16ww400,
              tabs: [
                Tab(text: AppLocalizations.of(context)?.myOrders ?? "My Orders"),
                Tab(text: AppLocalizations.of(context)?.otherOrders ?? "Other Orders"),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                MyOrderTab(),
                OtherOrderTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyOrderTab extends StatelessWidget {
  const MyOrderTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(bottom: 15.h),
            padding: EdgeInsets.only(
                left: 13.w, right: 12.w, top: 12.h, bottom: 14.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.grayD0D5DD,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextView(
                          "Chicken Tikka Pizza",
                          style: myTextStyle.font_16ww400.copyWith(
                            fontSize: 20.h,
                            fontWeight: FontWeight.w600,
                            color: MyColors.dark242424,
                          ),
                        ),
                        SizedBox(
                          width: 18.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: MyColors.dark000000),
                          ),
                          child: TextView(
                            "30:00",
                            style: myTextStyle.font_14w400.copyWith(
                              fontSize: 14.h,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TextView(
                        maxLine: 4,
                        "Lorem ipsum dolor sit consect adipiscing elit. Sed id..",
                        style: myTextStyle.font_12w400.copyWith(
                          fontSize: 16.h,
                          color: MyColors.gray979797,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Column(
                      children: [
                        TextView(
                          AppLocalizations.of(context)?.prepairingStarted ??
                          "Prepairing Started",
                          style: myTextStyle.font_14w500.copyWith(
                            color: const Color(0xffCAB900),
                            fontSize: 12.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: MyColors.primaryDark1D1929,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5 ),
                              child: TextView(
                                AppLocalizations.of(context)?.orderCompleted ??
                                "Order Completed",
                                maxLine: 1,
                                overflow: TextOverflow.ellipsis,
                                style: myTextStyle.font_14w500.copyWith(
                                  fontSize: 15.h,
                                  color: MyColors.primaryDark1D1929,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  height: 1,
                  color: MyColors.grayD0D5DD,
                  width: 209.w,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Wrap(
                    spacing: 15.w,
                    runSpacing: 10.h,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: AppLocalizations.of(context)?.orderTime ?? "Order Time: ",
                            style: myTextStyle.font_12w400.copyWith(
                              fontSize: 18.h,
                              color: MyColors.gray979797,
                            ),
                            children: [
                              TextSpan(
                                text: "10:31 AM",
                                style: myTextStyle.font_12w400.copyWith(
                                  fontSize: 18.h,
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text:AppLocalizations.of(context)?.quantity ?? "Quantity: ",
                            style: myTextStyle.font_12w400.copyWith(
                              fontSize: 18.h,
                              color: MyColors.gray979797,
                            ),
                            children: [
                              TextSpan(
                                text: "1",
                                style: myTextStyle.font_12w400.copyWith(
                                  fontSize: 18.h,
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text:AppLocalizations.of(context)?.guestName ?? "Guest Name: ",
                            style: myTextStyle.font_12w400.copyWith(
                              fontSize: 18.h,
                              color: MyColors.gray979797,
                            ),
                            children: [
                              TextSpan(
                                text: "Rahul K.",
                                style: myTextStyle.font_12w400.copyWith(
                                  fontSize: 18.h,
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text:AppLocalizations.of(context)?.roomNoLabel ?? "Room No:  ",
                            style: myTextStyle.font_12w400.copyWith(
                              fontSize: 18.h,
                              color: MyColors.gray979797,
                            ),
                            children: [
                              TextSpan(
                                text: "101",
                                style: myTextStyle.font_12w400.copyWith(
                                  fontSize: 18.h,
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text:AppLocalizations.of(context)?.orderSince ?? "Order Since : ",
                            style: myTextStyle.font_12w400.copyWith(
                              fontSize: 15.h,
                              color: MyColors.gray979797,
                            ),
                            children: [
                              TextSpan(
                                text: "30 Min",
                                style: myTextStyle.font_12w400.copyWith(
                                  fontSize: 15.h,
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: AppLocalizations.of(context)?.orderId ?? "Order ID: ",
                            style: myTextStyle.font_12w400.copyWith(
                              fontSize: 15.h,
                              color: MyColors.gray979797,
                            ),
                            children: [
                              TextSpan(
                                text: "10098",
                                style: myTextStyle.font_12w400.copyWith(
                                  fontSize: 15.h,
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 36.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: MyColors.redDD1111,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextView(
                            AppLocalizations.of(context)?.cancelOrder ??
                            " Cancel Order ",
                            style: myTextStyle.font_10w500.copyWith(
                              fontSize: 15.h,
                              color: MyColors.redEA445C,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}

class OtherOrderTab extends StatelessWidget {
  const OtherOrderTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(bottom: 15.h),
            padding: EdgeInsets.only(
                left: 13.w, right: 12.w, top: 12.h, bottom: 14.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.grayD0D5DD,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextView(
                          "Chicken Tikka Pizza (Medium)",
                          style: myTextStyle.font_16ww400.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.h,
                            color: MyColors.dark242424,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: MyColors.dark000000),
                          ),
                          child: TextView(
                            "30:00",
                            style: myTextStyle.font_14w400.copyWith(
                              fontSize: 13.h,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextView(
                        textAlign: TextAlign.center,
                        AppLocalizations.of(context)?.orderAcceptedBy ??
                        "Order Accepted By: Rahul Kumar ",
                        maxLine: 2,
                        style: myTextStyle.font_14w500.copyWith(
                          color: MyColors.primaryDark1D1929,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: RichText(
                          text: TextSpan(
                              text:AppLocalizations.of(context)?.additional ?? "Additional:  ",
                              style: myTextStyle.font_12w400.copyWith(
                                fontSize: 20.h,
                                color: MyColors.dark000000,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      "Lorem ipsum dolor sit amet, consect adipiscing elit. Sed id enim semper, vulputate.",
                                  style: myTextStyle.font_12w400.copyWith(
                                    fontSize: 18.h,
                                    color: MyColors.gray979797,
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  height: 1,
                  color: MyColors.grayF9F9F9,
                  width: 209.w,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Flexible(
                  child: Wrap(
                    spacing: 15.w,
                    runSpacing: 10.h,
                    children: [
                      RichText(
                        text: TextSpan(
                            text:AppLocalizations.of(context)?.orderTime ?? "Order Time: ",
                            style: myTextStyle.font_12w400.copyWith(
                              fontSize: 18.h,
                              color: MyColors.gray979797,
                            ),
                            children: [
                              TextSpan(
                                text: "10:31 AM",
                                style: myTextStyle.font_12w400.copyWith(
                                  fontSize: 18.h,
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: AppLocalizations.of(context)?.quantity ?? "Quantity: ",
                            style: myTextStyle.font_12w400.copyWith(
                              fontSize: 18.h,
                              color: MyColors.gray979797,
                            ),
                            children: [
                              TextSpan(
                                text: "1",
                                style: myTextStyle.font_12w400.copyWith(
                                  fontSize: 18.h,
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: AppLocalizations.of(context)?.guestName ?? "Guest Name: ",
                            style: myTextStyle.font_12w400.copyWith(
                              fontSize: 18.h,
                              color: MyColors.gray979797,
                            ),
                            children: [
                              TextSpan(
                                text: "Rahul K.",
                                style: myTextStyle.font_12w400.copyWith(
                                  fontSize: 18.h,
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: AppLocalizations.of(context)?.roomNoLabel ?? "Room No:  ",
                            style: myTextStyle.font_12w400.copyWith(
                              fontSize: 18.h,
                              color: MyColors.gray979797,
                            ),
                            children: [
                              TextSpan(
                                text: "101",
                                style: myTextStyle.font_12w400.copyWith(
                                  fontSize: 18.h,
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(

                            text: AppLocalizations.of(context)?.orderId ?? "Order ID: ",
                            style: myTextStyle.font_12w400.copyWith(
                              fontSize: 19.h,
                              color: MyColors.gray979797,
                            ),
                            children: [
                              TextSpan(
                                text: "10098",
                                style: myTextStyle.font_12w400.copyWith(
                                  fontSize: 19.h,
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
