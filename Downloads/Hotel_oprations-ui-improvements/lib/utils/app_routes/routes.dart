import 'package:kunggy_operational_app/presentation/auth/view/screens/enter_forgot_password_screen.dart';
import 'package:kunggy_operational_app/presentation/auth/view/screens/forgot_password_email_screen.dart';
import 'package:kunggy_operational_app/presentation/auth/view/screens/forgot_password_otp_screen.dart';
import 'package:kunggy_operational_app/presentation/auth/view/screens/login_screen.dart';
import 'package:kunggy_operational_app/presentation/auth/view/screens/select_language_screen.dart';
import 'package:kunggy_operational_app/presentation/auth/view/screens/two_factor_auth_screen.dart';
import 'package:kunggy_operational_app/presentation/base_screen/view/screen/base_screen.dart';
import 'package:kunggy_operational_app/presentation/cook/view/screen/food_order_screen.dart';
import 'package:kunggy_operational_app/presentation/home/view/home_screen.dart';
import 'package:kunggy_operational_app/presentation/house_keeping/view/screen/change_amenities_screen.dart';
import 'package:kunggy_operational_app/presentation/house_keeping/view/screen/mini_bar_refill_screen.dart';
import 'package:kunggy_operational_app/presentation/house_keeping/view/screen/report_issue_screen.dart';
import 'package:kunggy_operational_app/presentation/house_keeping/view/screen/today_checkout_screen.dart';
import 'package:kunggy_operational_app/presentation/notification/view/screen/notification_screen.dart';
import 'package:kunggy_operational_app/presentation/profile/view/screen/about_screen.dart';
import 'package:kunggy_operational_app/presentation/auth/view/screens/language_screen.dart';
import 'package:kunggy_operational_app/presentation/profile/view/screen/currency_screen.dart';
import 'package:kunggy_operational_app/presentation/profile/view/screen/profile_screen.dart';
import 'package:kunggy_operational_app/presentation/room_service/view/screens/room_service_minibar_screen.dart';
import 'package:kunggy_operational_app/presentation/room_service/view/screens/room_service_request_screen.dart';
import 'package:kunggy_operational_app/presentation/security/view/screens/employee_incoming_outgoing_screen.dart';
import 'package:kunggy_operational_app/presentation/security/view/screens/guest_check_in_screen.dart';
import 'package:kunggy_operational_app/presentation/security/view/screens/incoming_vehicle_screen.dart';
import 'package:kunggy_operational_app/presentation/security/view/screens/vehicle_in_out_screen.dart';
import 'package:kunggy_operational_app/presentation/splash/screen/splash_screen.dart';
import 'package:kunggy_operational_app/presentation/vendor/view/screens/quote_price_screen.dart';
import 'package:kunggy_operational_app/presentation/vendor/view/screens/vendor_screen.dart';
import 'package:kunggy_operational_app/presentation/order_food/view/screens/order_info.dart';
import 'package:kunggy_operational_app/presentation/manager/home/view/manager_dashboard.dart';
import 'package:kunggy_operational_app/presentation/profile/view/screen/setting_screen.dart';
import 'package:kunggy_operational_app/presentation/profile/view/screen/employee_rules.dart';
// import 'package:kunggy_operational_app/presentation/profile/view/screen/employee_rules.dart';
import 'package:kunggy_operational_app/presentation/security/view/screens/vendor_order_in_screen.dart';
import 'package:kunggy_operational_app/presentation/vendor/view/screens/order_history_list_screen.dart';
import 'package:kunggy_operational_app/presentation/order_food/view/screens/cart_view.dart';

import '../../presentation/auth/view/screens/access_pending_screen.dart';
import '../../presentation/base_screen/view/screen/housekeeping_base_screen.dart';
import '../../presentation/base_screen/view/screen/manager_base_screen.dart';
import '../../presentation/cook/view/screen/cook_dashboard.dart';
import '../../presentation/order_food/view/screens/orderfood_dashboard_screen.dart';
import '../../presentation/auth/view/screens/role_selection_screen.dart';
import '../../presentation/base_screen/view/screen/security_base_screen.dart';
import '../../presentation/base_screen/view/screen/order_food_base_screen.dart';
import '../../presentation/base_screen/view/screen/counter_sale_base_screen.dart';


class Routes {
  static String splashScreen = '/SplashScreen';
  static String loginScreen = '/LoginScreen';
  static String twoFactorAuthScreen = '/TwoFactorAuthScreen';
  static String forgotPasswordEmailScreen = '/ForgotPasswordEmailScreen';
  static String cookBaseScreen = "/CookBaseScreen";
  static String forgotPasswordOTPScreen = '/ForgotPasswordOTPScreen';
  static String enterForgotPasswordScreen = '/EnterForgotPasswordScreen';
  static String homeScreen = "/HomeScreen";
  static String notificationScreen = "/NotificationScreen";
  static String profileScreen = '/ProfileScreen';
  static String aboutScreen = "/AboutScreen";
  static String languageScreen = "/LanguageScreen";
  static String selectLanguageScreen = "/SelectLanguageScreen";
  static String todayCheckoutScreen = '/TodayCheckoutScreen';
  static String reportIssueScreen = "/ReportIssueScreen";
  static String minibarRefillScreen = "/MinibarRefillScreen";
  static String changeAmenitiesScreen = "/ChangeAmenitiesScreen";
  static String foodOrderScreen = "/FoodOrderScreen";
  static String roomServiceRequestScreen = "/RoomServiceRequestScreen";
  static String roomServiceMinibarScreen = "/RoomServiceMinibarScreen";

  static String employeeIncomingOutgoingScreen = "EmployeeIncomingOutgoingScreen";
  static String vehicleInOutScreen = "/VehicleInOutScreen";
  static String incomingVehicleScreen = "/IncomingVehicleScreen";
  static String guestCheckInScreen = "/GuestCheckInScreen";
  static String vendorScreen = "/VendorScreen";
  static String quotePriceScreen = "/QuotePriceScreen";
  static String foodOrderInfoScreen = "/FoodOrderInfoScreen";
  static String managerDashboardScreen= "/ManagerDashboardScreen";
  static String employeeRules= "/EmployeeRules";
  static String settingScreen= "/SettingScreen";
  static String currencyScreen= "/CurrencyScreen";
  static String vendorOrderInScreen= "/VendorOrderInScreen";
  static String orderHistoryListScreen= "/OrderHistoryListScreen";
  static String accessPendingScreen= "/AccessPendingScreen";
  static String cartScreen= "/CartScreen";
  static String managerBaseScreen= "/ManagerBaseScreen";
  static String housekeepingBaseScreen= "/HousekeepingBaseScreen";
  static String orderFoodDashboardScreen= "/OrderFoodDashboardScreen";
  static String cookDashboard= "/CookDashboard";
  static String roleSelectionScreen= "/RoleSelectionScreen";
  static String securityBaseScreen= "/SecurityBaseScreen";
  static String orderFoodBaseScreen= "/OrderFoodBaseScreen";
  static String counterSaleBaseScreen= "/CounterSaleBaseScreen";





  static get getRoutes => {
        Routes.splashScreen: (context) => const SplashScreen(),
        Routes.loginScreen: (context) => const LoginScreen(),
        Routes.twoFactorAuthScreen: (context) => const TwoFactorAuthScreen(),
        Routes.cookBaseScreen: (context) => const CookBaseScreen(),
        Routes.forgotPasswordEmailScreen: (context) =>
            const ForgotPasswordEmailScreen(),
        Routes.forgotPasswordOTPScreen: (context) =>
            const ForgotPasswordOTPScreen(),
        Routes.enterForgotPasswordScreen: (context) =>
            const EnterForgotPasswordScreen(),
        Routes.homeScreen: (context) => const HomeScreen(),
        Routes.notificationScreen: (context) => const NotificationScreen(),
        Routes.profileScreen: (context) => const ProfileScreen(),
        Routes.aboutScreen: (context) => const AboutScreen(),
        Routes.languageScreen: (context) => const LanguageScreen(),
        Routes.selectLanguageScreen: (context) => const SelectLanguageScreen(),
        Routes.todayCheckoutScreen: (context) => const TodayCheckoutScreen(),
        Routes.reportIssueScreen: (context) => const ReportIssueScreen(),
        Routes.minibarRefillScreen: (context) => const MiniBarRefillScreen(),
        Routes.changeAmenitiesScreen: (context) =>
            const ChangeAmenitiesScreen(),
        Routes.foodOrderScreen: (context) => const FoodOrderScreen(),
        Routes.roomServiceRequestScreen: (context) =>
            const RoomServiceRequestScreen(),
        Routes.roomServiceMinibarScreen: (context) =>
            const RoomServiceMinibarScreen(),
        Routes.employeeIncomingOutgoingScreen: (context) =>
            const EmployeeIncomingOutgoingScreen(),
        Routes.vehicleInOutScreen: (context) => const VehicleInOutScreen(),
        Routes.incomingVehicleScreen: (context) =>
            const IncomingVehicleScreen(),
        Routes.guestCheckInScreen: (context) => const GuestCheckInScreen(),
        Routes.vendorScreen: (context) => const VendorScreen(),
        Routes.quotePriceScreen: (context) => const QuotePriceScreen(),
        Routes.foodOrderInfoScreen: (context) => const FoodOrderInfoScreen(),
        Routes.managerDashboardScreen: (context) => const ManagerDashboardScreen(),
        Routes.employeeRules: (context) => const EmployeeRules(),
        Routes.managerDashboardScreen: (context) => const ManagerDashboardScreen(),
        Routes.settingScreen: (context) => const SettingScreen(),
        Routes.currencyScreen: (context) => const CurrencyScreen(),
        Routes.vendorOrderInScreen: (context) => const VendorOrderInScreen(),
        Routes.orderHistoryListScreen:(context) => const OrderHistoryListScreen(),
        Routes.accessPendingScreen:(context) => const AccessPendingScreen(),
         Routes.cartScreen:(context) => const CartScreen(),
         Routes.managerBaseScreen:(context) => ManagerBaseScreen(),
         Routes.housekeepingBaseScreen:(context) => HousekeepingBaseScreen(),
         Routes.orderFoodDashboardScreen:(context) => const OrderFoodDashboardScreen(),
         Routes.cookDashboard:(context) => const CookDashboard(),
         Routes.roleSelectionScreen:(context) => const RoleSelectionScreen(),
         Routes.securityBaseScreen:(context) => SecurityBaseScreen(),
         Routes.orderFoodBaseScreen:(context) => OrderFoodBaseScreen(),
         Routes.counterSaleBaseScreen:(context) => const CounterSaleBaseScreen(),
      };
}
