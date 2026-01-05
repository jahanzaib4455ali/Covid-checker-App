import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/widget/persistent_btm_navbar_scaffold.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/widget/screens.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/widget/bottom_nav_item.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../manager/view/screens/manager_dashboard.dart';


class CookBaseScreen extends StatefulWidget {
  static const String route = "CookBaseScreen";
  const CookBaseScreen({super.key});

  @override
  State<CookBaseScreen> createState() => _CookBaseScreenState();
}

class _CookBaseScreenState extends State<CookBaseScreen> {
  final _managerDashboardScreenKey = GlobalKey<NavigatorState>();
  // final _homenavigatorKey = GlobalKey<NavigatorState>();
  final _cookNavigatorKey = GlobalKey<NavigatorState>();
  // final _voiceChatNavigatorKey = GlobalKey<NavigatorState>();
  final _houseKeepingKey = GlobalKey<NavigatorState>();
  final _roomServiceKey = GlobalKey<NavigatorState>();
  final _securityNavigatorKey = GlobalKey<NavigatorState>();
  final _foodOrderInfoScreenKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final managerNavItems = [
      BottomNavItem(icon: Icons.dashboard, label: 'Dashboard', screen: const ManagerDashboardScreen()),
      // BottomNavItem(icon: Icons.people, label: 'Staff', screen: ManagerStaffScreen()),
      // ... more items
    ];

    return PersistentBottomBarScaffold(
      items: [
        // PersistentTabItem(
        //     tab: Screens.getScreens(context)[0],
        //     icon: MyIcons.home,
        //     title: 'Home',
        //     navigatorkey: _homenavigatorKey,
        //     routes: []),
        PersistentTabItem(
            tab: Screens.getScreens(context)[0],
            icon: MyIcons.manager,
            title: AppLocalizations.of(context)?.manager ?? 'Manager',
            navigatorkey: _managerDashboardScreenKey,
            routes: []),
        PersistentTabItem(
            tab: Screens.getScreens(context)[6],
            icon: MyIcons.foodOrder,
            title: AppLocalizations.of(context)?.foodOrder ?? 'Food Order ',
            navigatorkey: _foodOrderInfoScreenKey,
            routes: []),
        PersistentTabItem(
          tab: Screens.getScreens(context)[1],
          icon: "assets/icons/a.svg",
          title: AppLocalizations.of(context)?.tabHousekeeping ?? 'Housekeeping',
          navigatorkey: _houseKeepingKey,
          routes: [],
        ),
        PersistentTabItem(
          tab: Screens.getScreens(context)[2],
          icon: MyIcons.cook,
          title: AppLocalizations.of(context)?.cook ?? 'Cook',
          navigatorkey: _cookNavigatorKey,
          routes: [],
          arguments: {"fromHome": false},
        ),
        PersistentTabItem(
            tab: Screens.getScreens(context)[3],
            icon: MyIcons.roomservice,
            title: AppLocalizations.of(context)?.roomService ?? 'Room Service',
            navigatorkey: _roomServiceKey,
            routes: []),
        PersistentTabItem(
          tab: Screens.getScreens(context)[4],
          icon: MyIcons.security,
          title: AppLocalizations.of(context)?.security ?? 'Security',
          navigatorkey: _securityNavigatorKey,
          routes: [],
        ),

        // PersistentTabItem(
        //     tab: Screens.getScreens(context)[5],
        //     icon: MyIcons.voiceChat,
        //     title: 'Voice Chat',
        //     navigatorkey: _voiceChatNavigatorKey,
        //     routes: []),
      ],
    );
  }
}
