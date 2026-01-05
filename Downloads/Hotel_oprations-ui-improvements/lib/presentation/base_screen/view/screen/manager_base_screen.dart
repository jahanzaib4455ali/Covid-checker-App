import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/screen/module_base_screen.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/widget/bottom_nav_item.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import '../../../manager/view/screens/kips_screen.dart';
import '../../../manager/view/screens/manage_screen.dart';
import '../../../manager/view/screens/manager_dashboard.dart';
import '../../../manager/view/widgets/view_report.dart';

class ManagerBaseScreen extends StatelessWidget {
  ManagerBaseScreen({super.key});

  // Screenshot ke mutabiq 4 primary sections hain
  final List<GlobalKey<NavigatorState>> _navigatorKeys =
  List.generate(4, (_) => GlobalKey<NavigatorState>());

  @override
  Widget build(BuildContext context) {
    // Sequence aur Labels bilkul screenshot ke mutabiq set hain
    final navItems = [
      BottomNavItem(
          icon: MyIcons.home, // Dashboard icon
          label: 'Dashboard',
          screen: const ManagerDashboardScreen()
      ),
      BottomNavItem(
          icon: MyIcons.kips, // KPIs icon
          label: 'KPIs',
          screen: const KipsScreen()
      ),
      BottomNavItem(
          icon: MyIcons.manager, // Manage icon
          label: 'Manage',
          screen: const ManageScreen()
      ),
      BottomNavItem(
          icon: MyIcons.report, // Reports icon
          label: 'Reports',
          screen: const ViewReportsScreen()
      ),
    ];

    return ModuleBaseScreen(
      navItems: navItems,
      navigatorKeys: _navigatorKeys,
      // Yahan module_base_screen khud spacing handle karega
    );
  }
}