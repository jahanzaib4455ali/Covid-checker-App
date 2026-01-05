import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/screen/module_base_screen.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/widget/bottom_nav_item.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import '../../../house_keeping/view/screen/housekeeping_dashboard.dart';
import '../../../house_keeping/view/screen/task_screen.dart';
// Note: In screens ko apne project ke correct path ke mutabiq adjust kar lein
import '../../../house_keeping/view/screen/today_checkout_screen.dart';
import '../../../house_keeping/view/screen/unoccupied_rooms_screen.dart';
import '../../../house_keeping/view/screen/minibar_stock_screen.dart';
import '../../../house_keeping/view/screen/amenities_stock_screen.dart';

class HousekeepingBaseScreen extends StatelessWidget {
  HousekeepingBaseScreen({super.key});

  // Screenshot mein 4 items hain, isliye 4 keys generate hongi
  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(4, (_) => GlobalKey<NavigatorState>());

  @override
  Widget build(BuildContext context) {
    // Screenshot ke mutabiq labels aur items:
    final navItems = [
      BottomNavItem(
          icon: MyIcons.dashboard, // Dashboard Icon
          label: 'Dashboard',
          screen: const HousekeepingDashboard()
      ),
      BottomNavItem(
          icon: MyIcons.layer, // Tasks Icon
          label: 'Tasks',
          screen: const TaskScreen()
      ),
      BottomNavItem(
          icon: MyIcons.minibarRefill, // Minibar Icon
          label: 'Minibar Refill',
          screen: const MinibarStockScreen()
      ),
      BottomNavItem(
          icon: MyIcons.toiletries, // Amenities Icon
          label: 'Room Amenities',
          screen: const AmenitiesStockScreen()
      ),
    ];

    return ModuleBaseScreen(
      navItems: navItems,
      navigatorKeys: _navigatorKeys,
    );
  }
}