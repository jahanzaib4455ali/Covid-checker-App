import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/screen/module_base_screen.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/widget/bottom_nav_item.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import '../../../security/view/screens/security_home_screen.dart';
import '../../../security/view/screens/guest_check_in_screen.dart';
import '../../../security/view/screens/employee_incoming_outgoing_screen.dart';
import '../../../security/view/screens/vehicle_in_out_screen.dart';

class SecurityBaseScreen extends StatelessWidget {
  SecurityBaseScreen({super.key});

  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(4, (_) => GlobalKey<NavigatorState>());

  @override
  Widget build(BuildContext context) {
    final navItems = [
      BottomNavItem(icon: MyIcons.manager, label: 'Dashboard', screen: const SecurityHomeScreen()),
      BottomNavItem(icon: MyIcons.manager, label: 'Guest Check', screen: const GuestCheckInScreen()),
      BottomNavItem(icon: MyIcons.manager, label: 'Employee', screen: const EmployeeIncomingOutgoingScreen()),
      BottomNavItem(icon: MyIcons.manager, label: 'Vehicle', screen: const VehicleInOutScreen()),
    ];

    return ModuleBaseScreen(
      navItems: navItems,
      navigatorKeys: _navigatorKeys,
    );
  }
}