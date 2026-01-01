import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/widget/persistent_btm_navbar_scaffold.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/widget/bottom_nav_item.dart';

class ModuleBaseScreen extends StatelessWidget {
  final List<BottomNavItem> navItems;
  final List<GlobalKey<NavigatorState>> navigatorKeys;

  const ModuleBaseScreen({
    Key? key,
    required this.navItems,
    required this.navigatorKeys,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: List.generate(navItems.length, (index) {
        final item = navItems[index];
        return PersistentTabItem(
          tab: item.screen,
          icon: item.icon,
          title: item.label,
          navigatorkey: navigatorKeys[index],
          routes: [],
        );
      }),
    );
  }
}
