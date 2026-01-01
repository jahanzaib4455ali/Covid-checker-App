import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/presentation/auth/view/screens/login_screen.dart';
import 'package:kunggy_operational_app/presentation/cook/view/screen/food_order_screen.dart';
import 'package:kunggy_operational_app/presentation/home/view/home_screen.dart';
import 'package:kunggy_operational_app/presentation/house_keeping/view/screen/task_screen.dart';
import 'package:kunggy_operational_app/presentation/manager/home/view/manager_dashboard.dart';
import 'package:kunggy_operational_app/presentation/order_food/view/screens/order_info.dart';
import 'package:kunggy_operational_app/presentation/room_service/view/screens/room_service_request_screen.dart';
import 'package:kunggy_operational_app/presentation/security/view/screens/security_home_screen.dart';
import 'package:kunggy_operational_app/presentation/order_food/view/screens/order_info.dart';

class Screens {
  static List<Widget> getScreens(BuildContext context) => [
        // const HomeScreen(),
        const ManagerDashboardScreen(),
        const TaskScreen(),
        const FoodOrderScreen(),
        const RoomServiceRequestScreen(),
        const SecurityHomeScreen(),
        const LoginScreen(),
        const FoodOrderInfoScreen(),
      ];

  static Widget getCurrentScreen(BuildContext context, int index) =>
      getScreens(context)[index];
}
