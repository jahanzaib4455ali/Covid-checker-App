import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kunggy_operational_app/common/widget/general_appbar.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:intl/intl.dart';

class CookDashboard extends StatefulWidget {
  const CookDashboard({super.key});

  @override
  State<CookDashboard> createState() => _CookDashboardState();
}

class _CookDashboardState extends State<CookDashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h), // Adjust height as needed
        child: const GeneralAppBar(
          isBackButton: false,
          isNotification: true,
          isProfile: false,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTimeTrackingSection(),
              _buildImportantBroadcast(),
              _buildWelcomeSection(),
              _buildLiveKitchenSummary(),
              _buildPerformanceSnapshot(),
              _buildLowInventoryNotices(),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTimeTrackingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text('04:46', style: myTextStyle.font_32w700),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: MyColors.primaryGreen00A35E,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Currently Working', style: myTextStyle.font_14w600.copyWith(color: Colors.white)),
                ),
              ),
              const Spacer(),
              Text('Time Details', style: myTextStyle.font_14w600.copyWith(color: MyColors.grayFFEFEFF4)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTimeDetailColumn('Request Delay', '01:45'),
              _buildTimeDetailColumn('Break Time', '03:45'),
              _buildTimeDetailColumn('Idle Time', '00:45'),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: MyColors.primaryDark1D1929,
                side: const BorderSide(color: MyColors.grayD0D5DD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text('Take a Brake', style: myTextStyle.font_16ww700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeDetailColumn(String label, String time) {
    return Column(
      children: [
        Text(label, style: myTextStyle.font_14w500.copyWith(color: MyColors.gray979797)),
        const SizedBox(height: 4),
        Text(time, style: myTextStyle.font_18w600),
      ],
    );
  }

  Widget _buildImportantBroadcast() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: MyColors.grayF7F7F8,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SvgPicture.asset(MyIcons.search),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Today Important Broadcast', style: myTextStyle.font_16ww700),
                  const SizedBox(height: 4),
                  Text('Lorem ipsum dolor sit amet, consect adipiscing elit. Sed id enim semper vulputate.',
                      style: myTextStyle.font_14w400.copyWith(color: MyColors.gray979797)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hey Rajeev', style: myTextStyle.font_20wMedium),
              Text('Welcome to dashboard!', style: myTextStyle.font_14w500.copyWith(color: MyColors.gray979797)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.grayD0D5DD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today_outlined, size: 16, color: MyColors.grayFFEFEFF4),
                const SizedBox(width: 8),
                Text(DateFormat('dd-MM-yyyy').format(DateTime.now()), style: myTextStyle.font_14w500.copyWith(color: MyColors.grayFFEFEFF4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveKitchenSummary() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Live Kitchen Summary', style: myTextStyle.font_18w600),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 2.0,
            children: [
              _buildSummaryCard('Total Active Orders', '120'),
              _buildSummaryCard('Currently Cooking', '59'),
              _buildSummaryCard('Ready To Serve', '45'),
              _buildSummaryCard('Orders Delayed', '06'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MyColors.grayD0D5DD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: myTextStyle.font_14w500.copyWith(color: MyColors.gray979797), maxLines: 2, overflow: TextOverflow.ellipsis),
          Text(value, style: myTextStyle.font_32w700),
        ],
      ),
    );
  }

  Widget _buildPerformanceSnapshot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Performance Snapshot', style: myTextStyle.font_18w600),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 2.0,
            children: [
              _buildSummaryCard('Order Completed', '120'),
              _buildSummaryCard('Preparation Time', '12 Minutes'),
              _buildSummaryCard('Fastest Served', '7 Minutes'),
              _buildSummaryCard('Most Delayed', '20 Minutes'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLowInventoryNotices() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Low Inventory Notices', style: myTextStyle.font_18w600),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 2.0,
            children: [
              _buildSummaryCard('Cheese Serving Left', '02'),
              _buildSummaryCard('Roti Dough Left', '01'),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildBottomNavigationBar() {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     backgroundColor: Colors.white,
  //     selectedItemColor: Colors.black,
  //     unselectedItemColor: MyColors.gray979797,
  //     selectedLabelStyle: myTextStyle.font_12w400.copyWith(fontWeight: FontWeight.w600),
  //     unselectedLabelStyle: myTextStyle.font_12w400,
  //     currentIndex: _currentIndex,
  //     onTap: (index) {
  //       setState(() {
  //         _currentIndex = index;
  //       });
  //     },
  //     items: [
  //       BottomNavigationBarItem(
  //         icon: SvgPicture.asset(MyIcons.dashboard, colorFilter: ColorFilter.mode(_currentIndex == 0 ? Colors.black : MyColors.gray979797, BlendMode.srcIn)),
  //         label: 'Dashboard',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: SvgPicture.asset(MyIcons.takeOrders, colorFilter: ColorFilter.mode(_currentIndex == 1 ? Colors.black : MyColors.gray979797, BlendMode.srcIn)),
  //         label: 'Take Orders',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: SvgPicture.asset(MyIcons.prepareOrder, colorFilter: ColorFilter.mode(_currentIndex == 2 ? Colors.black : MyColors.gray979797, BlendMode.srcIn)),
  //         label: 'Prepare Order',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: SvgPicture.asset(MyIcons.kitchenOperation, colorFilter: ColorFilter.mode(_currentIndex == 3 ? Colors.black : MyColors.gray979797, BlendMode.srcIn)),
  //         label: 'Kitchen Operation',
  //       ),
  //     ],
  //   );
  // }
}
