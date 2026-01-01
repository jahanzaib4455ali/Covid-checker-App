# Kunggy Hotel Operations App - Complete Development Context

## 📋 Project Overview

**Project Name:** Kunggy Hotel Operations App  
**Package Name:** kunggy_operational_app  
**Framework:** Flutter (SDK >=3.4.1 <4.0.0)  
**Current Version:** 1.0.0+1  
**Platform:** Cross-platform (Android, iOS, Web, Windows, Linux, macOS)  
**Development Environment:** Windows PowerShell  
**MCP Integration:** ✅ Configured with Model Context Protocol tools

This is a comprehensive hotel management system designed to streamline hotel operations through role-based access control. The application supports multiple user roles including Manager, Housekeeper, Cook, Security, Vendor, Room Service, and other hotel staff members.

## 🏗️ Current Architecture

### Application Flow
```
Login/Signup → Location Access → Role Selection → Role-Specific Dashboard
```

### Key Features
- **Multi-Role Support:** Manager, Housekeeper, Cook, Security, Vendor
- **Localization:** Multi-language support (including RTL languages like Arabic and Urdu)
- **Real-time Operations:** Task management, order processing, room service
- **QR Code Integration:** For room and asset management
- **Notification System:** Real-time updates and alerts

## 📱 Current Project Structure (Updated)

```
lib/
├── main.dart                          # App entry point with Material 3 theming
├── base_state/
│   └── base_state.dart                # Base state management
├── common/
│   └── widget/                       # Reusable UI components
│       ├── app_drawer.dart            # Navigation drawer
│       ├── general_scaffold.dart      # Common scaffold structure
│       ├── my_text_field.dart         # Custom text field
│       ├── bottom_sheet/             # Bottom sheet components
│       ├── my_buttons/               # Custom button widgets
│       ├── my_loader/                # Loading indicators
│       ├── snack_bar/                # Snackbar notifications
│       └── toast/                    # Toast messages
├── l10n/                             # Internationalization
│   ├── intl_en.arb                   # English (default)
│   ├── intl_ar.arb                   # Arabic (RTL)
│   ├── intl_ur.arb                   # Urdu (RTL)
│   ├── intl_es.arb                   # Spanish
│   ├── intl_fr.arb                   # French
│   ├── intl_de.arb                   # German
│   ├── intl_it.arb                   # Italian
│   ├── intl_pt.arb                   # Portuguese
│   ├── intl_hi.arb                   # Hindi
│   ├── intl_ta.arb                   # Tamil
│   ├── intl_th.arb                   # Thai
│   ├── intl_vi.arb                   # Vietnamese
│   ├── intl_zh.arb                   # Chinese
│   ├── intl_ru.arb                   # Russian
│   └── intl_id.arb                   # Indonesian
├── presentation/                     # UI Layer (Clean Architecture)
│   ├── splash/
│   │   └── screen/splash_screen.dart # App initialization
│   ├── auth/                        # Authentication module
│   │   └── view/screens/
│   │       ├── login_screen.dart
│   │       ├── forgot_password_email_screen.dart
│   │       ├── forgot_password_otp_screen.dart
│   │       ├── enter_forgot_password_screen.dart
│   │       ├── access_pending_screen.dart
│   │       └── role_selection_screen.dart  # Role picker
│   ├── home/
│   │   └── view/home_screen.dart     # General home screen
│   ├── base_screen/                 # Role-based navigation
│   │   └── view/screen/
│   │       ├── base_screen.dart      # Generic base
│   │       ├── manager_base_screen.dart
│   │       ├── housekeeping_base_screen.dart
│   │       ├── security_base_screen.dart
│   │       └── order_food_base_screen.dart
│   ├── manager/                     # Manager module
│   │   └── view/screen/
│   │       └── manager_dashboard.dart
│   ├── house_keeping/               # Housekeeping module
│   │   └── view/screen/
│   │       ├── housekeeping_dashboard.dart
│   │       ├── change_amenities_screen.dart
│   │       ├── mini_bar_refill_screen.dart
│   │       ├── report_issue_screen.dart
│   │       ├── task_screen.dart
│   │       └── today_checkout_screen.dart
│   ├── cook/                        # Kitchen/Cook module
│   │   └── view/screen/
│   │       ├── cook_dashboard.dart
│   │       └── food_order_screen.dart
│   ├── security/                    # Security module
│   │   └── view/screens/
│   │       ├── employee_incoming_outgoing_screen.dart
│   │       ├── guest_check_in_screen.dart
│   │       ├── incoming_vehicle_screen.dart
│   │       ├── vehicle_in_out_screen.dart
│   │       └── vendor_order_in_screen.dart
│   ├── vendor/                      # Vendor module
│   │   └── view/screens/
│   │       ├── vendor_screen.dart
│   │       ├── quote_price_screen.dart
│   │       └── order_history_list_screen.dart
│   ├── room_service/                # Room service module
│   │   └── view/screens/
│   │       ├── room_service_request_screen.dart
│   │       └── room_service_minibar_screen.dart
│   ├── order_food/                  # Food ordering system
│   │   └── view/
│   │       ├── screens/
│   │       │   ├── orderfood_dashboard_screen.dart
│   │       │   ├── cart_view.dart
│   │       │   ├── food_menu.dart
│   │       │   └── order_info.dart
│   │       ├── widgets/
│   │       └── bloc/                # BLoC state management
│   │           └── filter_bloc.dart
│   ├── profile/                     # User profile management
│   │   └── view/screen/
│   │       ├── profile_screen.dart
│   │       ├── setting_screen.dart
│   │       ├── about_screen.dart
│   │       ├── language_screen.dart
│   │       ├── currency_screen.dart
│   │       └── employee_rules.dart
│   └── notification/                # Notification system
│       └── view/screen/
│           └── notification_screen.dart
├── service/                         # Business Logic Layer
│   ├── di.dart                      # Dependency injection setup
│   ├── locale_cubit/
│   │   └── localCubit.dart          # Localization state management
│   ├── location/
│   │   └── location_service.dart    # GPS/Location services
│   └── remote/                      # API & Network layer
│       ├── network_api_services.dart
│       ├── api_urls.dart
│       └── api_headers.dart
├── theme/                           # App theming
│   ├── my_colors.dart               # Color constants
│   ├── my_icons.dart                # Icon constants
│   └── my_text_styles.dart          # Typography styles
└── utils/                          # Utilities & helpers
    ├── app_constants/
    │   └── app_context.dart         # Global app context
    ├── app_routes/
    │   └── routes.dart              # Navigation routing
    ├── extensions/
    │   └── response_extension.dart  # HTTP response helpers
    └── shared_pref_manager/
        └── shared_pref.dart         # Local storage management
```

## 🎭 Role-Based Modules

### 1. Manager Module
**Base Screen:** `ManagerBaseScreen`  
**Dashboard:** `ManagerDashboardScreen`

**Features:**
- Dashboard with key metrics (check-ins, check-outs, available rooms)
- Task creation and management
- Report viewing and analytics
- Staff oversight capabilities

**Navigation Items:**
- Dashboard
- Create Task
- View Reports

### 2. Housekeeper Module
**Base Screen:** `HousekeepingBaseScreen`

**Features:**
- Room status management
- Amenity changes
- Mini-bar refilling
- QR code scanning for room identification
- Issue reporting
- Daily checkout tracking
- Unoccupied room monitoring

### 3. Cook/Kitchen Module
**Base Screen:** `CookBaseScreen`  
**Dashboard:** `CookDashboard`

**Features:**
- Order queue management
- Food preparation tracking
- Kitchen inventory
- Order prioritization

### 4. Security Module
**Features:**
- Guest check-in/check-out
- Employee attendance tracking
- Vehicle entry/exit monitoring
- Vendor order verification
- Security incident reporting

### 5. Vendor Module
**Features:**
- Order history management
- Price quotations
- Order dispatch tracking
- Hotel communication interface

### 6. Room Service Module
**Features:**
- Service request handling
- Mini-bar management
- Guest service tracking

## 🔧 Technical Stack

### Core Dependencies (from pubspec.yaml)

**Runtime Dependencies:**
- **Flutter SDK:** >=3.4.1 <4.0.0
- **State Management:** 
  - flutter_bloc ^8.1.6 (BLoC pattern)
  - bloc ^8.1.4 (Core BLoC library)
  - equatable ^2.0.7 (Value equality)
- **UI & Responsive Design:**
  - flutter_screenutil ^5.9.3 (Screen adaptation)
  - flutter_svg ^2.0.10+1 (SVG support)
  - dotted_line ^3.2.3 (UI decorations)
  - cupertino_icons ^1.0.6 (iOS-style icons)
- **Networking & HTTP:**
  - http ^1.2.2 (HTTP client)
- **Local Storage:**
  - shared_preferences ^2.3.2 (Key-value storage)
- **Dependency Injection:**
  - get_it ^8.0.0 (Service locator)
- **Internationalization:**
  - flutter_localization ^0.3.2 (Multi-language support)
- **Device Features:**
  - qr_code_scanner ^1.0.1 (QR/Barcode scanning)
  - permission_handler ^11.4.0 (Runtime permissions)
- **User Feedback:**
  - fluttertoast ^8.2.8 (Toast notifications)
  - pin_code_fields ^8.0.1 (OTP/PIN input)

**Dev Dependencies:**
- flutter_test (Testing framework)
- flutter_lints ^3.0.0 (Linting rules)

### Key Features
- **Responsive Design:** Using ScreenUtil for adaptive layouts
- **Internationalization:** Support for multiple languages including RTL
- **Custom Fonts:** Plus Jakarta Sans, Visby Round CF, Montserrat, WinkySans, Josefin Sans, Karla
- **Custom UI Components:** Reusable buttons, text fields, loaders, and containers

## 🔄 Application Flow

### Authentication Flow
1. **Splash Screen** → Initial app loading
2. **Login Screen** → User authentication
3. **Location Access Screen** → Permission handling
4. **Role Selection** → User chooses their role
5. **Role-Specific Base Screen** → Navigation to appropriate dashboard

### Role Selection Implementation
Currently, the app has base screens for different roles but needs a proper role selection interface. The current flow directly navigates to specific role dashboards.

## 🎯 Recommended Improvements

### 1. Enhanced Folder Structure

```
lib/
├── core/                           # Core functionality
│   ├── constants/
│   ├── utils/
│   ├── exceptions/
│   └── network/
├── data/                           # Data layer
│   ├── models/
│   ├── repositories/
│   └── data_sources/
├── domain/                         # Business logic
│   ├── entities/
│   ├── repositories/
│   └── use_cases/
├── presentation/                   # UI layer
│   ├── shared/                     # Shared components
│   │   ├── widgets/
│   │   └── themes/
│   ├── auth/                       # Authentication module
│   └── modules/                    # Role-specific modules
│       ├── manager/
│       │   ├── blocs/
│       │   ├── screens/
│       │   └── widgets/
│       ├── housekeeper/
│       │   ├── blocs/
│       │   ├── screens/
│       │   └── widgets/
│       ├── cook/
│       │   ├── blocs/
│       │   ├── screens/
│       │   └── widgets/
│       ├── security/
│       │   ├── blocs/
│       │   ├── screens/
│       │   └── widgets/
│       └── vendor/
│           ├── blocs/
│           ├── screens/
│           └── widgets/
└── services/                      # External services
    ├── api/
    ├── storage/
    └── location/
```

### 2. Role Selection Screen Implementation

Create a dedicated role selection screen after login:

```dart
// lib/presentation/auth/screens/role_selection_screen.dart
class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            // Role cards for each role
            // Manager, Housekeeper, Cook, Security, Vendor, etc.
          ],
        ),
      ),
    );
  }
}
```

### 3. Enhanced Base Screen Architecture

Improve the base screen to be more flexible:

```dart
// lib/presentation/shared/screens/role_base_screen.dart
class RoleBaseScreen extends StatelessWidget {
  final UserRole role;
  final List<NavigationItem> navigationItems;
  final Widget dashboard;
  
  const RoleBaseScreen({
    required this.role,
    required this.navigationItems,
    required this.dashboard,
  });
}
```

### 4. State Management Enhancement

Implement proper BLoC pattern for each module:

```
module/
├── blocs/
│   ├── module_bloc.dart
│   ├── module_event.dart
│   └── module_state.dart
├── screens/
└── widgets/
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.4.1)
- Android Studio / VS Code
- Git

### Installation
```bash
# Clone the repository
git clone [repository-url]

# Navigate to project directory
cd kunggy-operation-flutter

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Build Commands
```bash
# Build APK
flutter build apk

# Build iOS
flutter build ios

# Build Web
flutter build web
```

## 🔧 Configuration

### Environment Setup
1. Configure API endpoints in `lib/service/remote/`
2. Set up localization files in `lib/l10n/`
3. Configure app permissions in platform-specific files

### Theming
- Primary colors and styles defined in `lib/theme/`
- Custom fonts configured in `pubspec.yaml`
- Material 3 design system implemented

## 🗺️ Complete Route Mapping

### Authentication Routes
- `/SplashScreen` → `SplashScreen()`
- `/LoginScreen` → `LoginScreen()`
- `/ForgotPasswordEmailScreen` → `ForgotPasswordEmailScreen()`
- `/ForgotPasswordOTPScreen` → `ForgotPasswordOTPScreen()`
- `/EnterForgotPasswordScreen` → `EnterForgotPasswordScreen()`
- `/AccessPendingScreen` → `AccessPendingScreen()`
- `/RoleSelectionScreen` → `RoleSelectionScreen()`

### Base/Dashboard Routes
- `/HomeScreen` → `HomeScreen()`
- `/ManagerBaseScreen` → `ManagerBaseScreen()`
- `/HousekeepingBaseScreen` → `HousekeepingBaseScreen()`
- `/SecurityBaseScreen` → `SecurityBaseScreen()`
- `/OrderFoodBaseScreen` → `OrderFoodBaseScreen()`
- `/CookBaseScreen` → `CookBaseScreen()`

### Module-Specific Routes
**Manager Module:**
- `/ManagerDashboardScreen` → `ManagerDashboardScreen()`

**Housekeeping Module:**
- `/TodayCheckoutScreen` → `TodayCheckoutScreen()`
- `/ReportIssueScreen` → `ReportIssueScreen()`
- `/MinibarRefillScreen` → `MiniBarRefillScreen()`
- `/ChangeAmenitiesScreen` → `ChangeAmenitiesScreen()`

**Cook Module:**
- `/CookDashboard` → `CookDashboard()`
- `/FoodOrderScreen` → `FoodOrderScreen()`

**Security Module:**
- `EmployeeIncomingOutgoingScreen` → `EmployeeIncomingOutgoingScreen()`
- `/VehicleInOutScreen` → `VehicleInOutScreen()`
- `/IncomingVehicleScreen` → `IncomingVehicleScreen()`
- `/GuestCheckInScreen` → `GuestCheckInScreen()`
- `/VendorOrderInScreen` → `VendorOrderInScreen()`

**Vendor Module:**
- `/VendorScreen` → `VendorScreen()`
- `/QuotePriceScreen` → `QuotePriceScreen()`
- `/OrderHistoryListScreen` → `OrderHistoryListScreen()`

**Room Service Module:**
- `/RoomServiceRequestScreen` → `RoomServiceRequestScreen()`
- `/RoomServiceMinibarScreen` → `RoomServiceMinibarScreen()`

**Food Ordering Module:**
- `/OrderFoodDashboardScreen` → `OrderFoodDashboardScreen()`
- `/FoodOrderInfoScreen` → `FoodOrderInfoScreen()`
- `/CartScreen` → `CartScreen()`

**Profile & Settings:**
- `/ProfileScreen` → `ProfileScreen()`
- `/SettingScreen` → `SettingScreen()`
- `/AboutScreen` → `AboutScreen()`
- `/LanguageScreen` → `LanguageScreen()`
- `/CurrencyScreen` → `CurrencyScreen()`
- `/EmployeeRules` → `EmployeeRules()`
- `/NotificationScreen` → `NotificationScreen()`

## 🤖 Model Context Protocol (MCP) Integration

### MCP Setup Status
✅ **MCP Tools Installed:** `pip install mcp` (version 1.18.0)
✅ **Project Context Generated:** Complete codebase analysis available
✅ **Development Environment:** Windows PowerShell compatible

### MCP Context Configuration
```json
{
  "project_type": "flutter_mobile_app",
  "domain": "hotel_operations_management",
  "architecture": "clean_architecture_with_bloc",
  "primary_language": "dart",
  "framework": "flutter",
  "state_management": "bloc_pattern",
  "key_features": [
    "multi_role_authentication",
    "role_based_navigation",
    "internationalization",
    "qr_scanning",
    "real_time_operations",
    "multi_module_architecture"
  ],
  "modules": {
    "auth": "Authentication and role selection",
    "manager": "Management dashboard and task creation",
    "housekeeping": "Room management and maintenance tasks",
    "cook": "Kitchen operations and food orders",
    "security": "Access control and monitoring",
    "vendor": "Supplier management and orders",
    "room_service": "Guest service requests",
    "order_food": "Food ordering system",
    "profile": "User settings and preferences"
  },
  "supported_languages": [
    "en", "ar", "ur", "es", "fr", "de", "it", "pt", 
    "hi", "ta", "th", "vi", "zh", "ru", "id"
  ]
}
```

### MCP Usage Guidelines
1. **Code Analysis:** Use MCP to understand module interactions
2. **Feature Development:** Leverage context for new feature implementation
3. **Debugging:** Utilize MCP for cross-module issue resolution
4. **Documentation:** Auto-generate documentation updates
5. **Testing:** Context-aware test case generation

## 📱 Current Issues & Improvements Needed

### Issues Identified:
1. **Role Selection Flow:** ✅ Role selection screen implemented
2. **Code Duplication:** Similar code in different base screens
3. **Navigation Consistency:** ✅ Comprehensive routing system in place
4. **State Management:** ✅ BLoC pattern implemented (filter_bloc in order_food)
5. **Error Handling:** Need centralized error handling
6. **API Integration:** Basic API setup needs enhancement

### Recommended Next Steps:
1. Implement proper role selection screen
2. Refactor base screens to reduce duplication
3. Enhance state management with BLoC pattern
4. Implement proper error handling
5. Add unit and widget tests
6. Improve API error handling and retry mechanisms
7. Add offline capability
8. Implement proper logging system

## 📊 Module Breakdown

| Module | Screens | Features | Status |
|--------|---------|----------|--------|
| Manager | 3+ | Dashboard, Task Creation, Reports | ✅ Implemented |
| Housekeeper | 7+ | Room Management, QR Scanner, Tasks | ✅ Implemented |
| Cook | 2+ | Order Management, Kitchen Operations | ✅ Implemented |
| Security | 6+ | Access Control, Vehicle Tracking | ✅ Implemented |
| Vendor | 4+ | Order History, Quotations | ✅ Implemented |
| Room Service | 2+ | Service Requests, Mini-bar | ✅ Implemented |
| Profile | 5+ | Settings, Language, Currency | ✅ Implemented |

## 🔐 Security Considerations

- Implement proper authentication tokens
- Add role-based access control at API level
- Secure local storage of sensitive data
- Implement proper session management
- Add biometric authentication option

## 🌐 Localization Support

The app supports multiple languages with RTL (Right-to-Left) layout support:
- English (default)
- Arabic (RTL)
- Urdu (RTL)
- Configurable through app settings

## 📞 Support & Contact

For technical support or project inquiries:
- Review code documentation in respective modules
- Check inline comments for implementation details
- Follow Flutter best practices for contributions

---

## 🚀 Development Environment Setup

### Prerequisites
- Flutter SDK (>=3.4.1 <4.0.0)
- Dart SDK (included with Flutter)
- Windows PowerShell (current environment)
- MCP Tools (installed via `pip install mcp`)
- Android Studio / VS Code
- Git for version control

### Quick Start Commands
```powershell
# Install dependencies
flutter pub get

# Run the app
flutter run

# Build APK
flutter build apk

# Generate localization files
flutter gen-l10n

# Run MCP analysis
mcp tools
```

### Font Assets
The app includes premium font families:
- **Plus Jakarta Sans** (Primary font)
- **Visby Round CF** (Secondary)
- **Montserrat** (Body text)
- **WinkySans** (Display)
- **Josefin Sans** (Headers)
- **Karla** (Interface elements)

### Asset Structure
```
assets/
├── images/          # App images and illustrations
├── icons/           # Custom icons and graphics
└── fonts/           # Font families (6 different typefaces)
    ├── PlusJakartaSans/
    ├── VisbyRound/
    ├── montserrat/
    ├── Winky_Sans/
    ├── Josefin_Sans/
    └── Karla/
```

---

**Last Updated:** October 19, 2025  
**Version:** 1.0.0+1  
**MCP Integration:** ✅ Active  
**Development Context:** Complete & Up-to-date  
**Environment:** Windows PowerShell  
**Maintainer:** Development Team
