import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/screen/module_base_screen.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/widget/bottom_nav_item.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import '../../../cook/view/screen/cook_dashboard.dart';
import '../../../cook/view/screen/food_order_screen.dart';
import '../../../order_food/view/screens/orderfood_dashboard_screen.dart';

class CookBaseScreen extends StatelessWidget {
  CookBaseScreen ({super.key});

  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(3, (_) => GlobalKey<NavigatorState>());

  @override
  Widget build(BuildContext context) {
    final navItems = [
      BottomNavItem(icon: MyIcons.manager, label: 'Dashboard', screen: const CookDashboard()),
      BottomNavItem(icon: MyIcons.manager, label: 'Orders', screen: const FoodOrderScreen()),
      BottomNavItem(icon: MyIcons.manager, label: 'Menu', screen: const OrderFoodDashboardScreen()),
    ];

    return ModuleBaseScreen(
      navItems: navItems,
      navigatorKeys: _navigatorKeys,
    );
  }
}
