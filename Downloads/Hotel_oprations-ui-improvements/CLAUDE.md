# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Hotel Operations Management Flutter App** that provides role-based interfaces for different hotel staff members (Manager, Housekeeping, Cook, Security, Counter Sale, Order Food, Vendor). The app uses **Flutter BLoC** for state management and follows a **feature-based modular architecture**.

## Essential Commands

### Development
```bash
# Run the app in debug mode
flutter run

# Run on specific device
flutter run -d <device-id>

# Hot reload during development (press 'r' in terminal)
# Hot restart (press 'R' in terminal)

# Clean build artifacts
flutter clean

# Get dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade
```

### Code Generation
```bash
# Generate localization files (after modifying .arb files in lib/l10n/)
flutter gen-l10n

# Or use pub get which triggers generation due to "generate: true" in pubspec.yaml
flutter pub get
```

### Build
```bash
# Build APK (Android)
flutter build apk

# Build APK in release mode (optimized)
flutter build apk --release

# Build app bundle for Play Store
flutter build appbundle

# Build for iOS (macOS only)
flutter build ios
```

### Testing & Quality
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Analyze code for issues
flutter analyze

# Format code
dart format lib/
```

## Architecture Overview

### Project Structure

```
lib/
├── base_state/           # Base state management utilities (LoaderState mixin)
├── common/               # Shared components
│   ├── models/          # Common data models (DashboardStats, etc.)
│   └── widget/          # Reusable UI components
├── l10n/                # Localization files (.arb format)
├── presentation/        # Feature modules (role-based)
│   ├── auth/           # Authentication screens
│   ├── manager/        # Manager module with sub-modules
│   ├── house_keeping/  # Housekeeping tasks and dashboard
│   ├── order_food/     # Food ordering with BLoC
│   ├── cook/           # Cook dashboard and order queue
│   ├── counter_sale/   # Counter sales and payment
│   ├── security/       # Security check-in and tracking
│   └── ...             # Other role-based modules
├── service/            # Core services
│   ├── di.dart         # Dependency injection setup
│   ├── locale_cubit/   # Localization BLoC
│   └── remote/         # API client and configuration
├── theme/              # Design system
│   ├── my_colors.dart
│   ├── my_text_styles.dart
│   └── my_icons.dart
├── utils/              # Utilities
│   ├── app_routes/     # Navigation routes
│   ├── app_constants/  # Constants and global context
│   ├── extensions/     # Extension methods
│   └── shared_pref_manager/
└── main.dart
```

### State Management Pattern

**BLoC (Business Logic Component)** is used throughout the app with the following structure:

- **Events**: User actions or triggers (`FilterEvent`, `SelectSort`, etc.)
- **States**: Immutable state objects with `copyWith()` pattern
- **BLoCs**: Event handlers that emit new states
- **Equatable**: All events and states extend `Equatable` for comparison

**Example Location**: `lib/presentation/order_food/view/bloc/filter_bloc.dart`

### Data Layer

**Service-based pattern** (no traditional repository layer):
- Services are located within feature modules: `lib/presentation/{feature}/services/`
- Manager module uses complete **Models > Services > Views** hierarchy
- Direct API calls via `NetworkApiService` in `lib/service/remote/network_api_services.dart`

**API Client Methods**:
- `getGetApiResponse(url, {addAccessToken, contentTypeJson})`
- `getPostApiResponse(url, data, {token})`
- `getPutApiResponse(url, data)`
- `getPatchApiResponse(url, data)`

**Base URL**: `https://api.roboti.app`

### Dependency Injection (GetIt)

**Setup Location**: `lib/service/di.dart`

Currently registered services:
- `SharedPreferences` (lazy singleton)
- `SharedPrefsManager` (lazy singleton)
- `TextStyleCustom` (lazy singleton)

**Usage**:
```dart
final myTextStyle = getIt.get<TextStyleCustom>();
getIt<SharedPrefsManager>().setLocale(locale.toString());
```

**Initialization**: Called in `main.dart` via `await setupDI();`

### Navigation System

**Named routes pattern** defined in `lib/utils/app_routes/routes.dart`:
```dart
class Routes {
  static String splashScreen = '/SplashScreen';
  static String loginScreen = '/LoginScreen';
  // ... 40+ route definitions

  static get getRoutes => {
    Routes.splashScreen: (context) => const SplashScreen(),
    // ...
  };
}
```

**Global Navigation Context**: `lib/utils/app_constants/app_context.dart`
```dart
GlobalContext.navigatorKey  // Access from anywhere
GlobalContext.currentContext
GlobalContext.currentState
```

**Modular Bottom Navigation**: Each role has its own base screen with persistent bottom navigation and independent navigator stacks per tab.

### Localization

**Supported Languages**: 15+ languages including English (default), Arabic, Chinese, Hindi, Spanish, French, etc.

**Files Location**: `lib/l10n/intl_{locale}.arb`

**State Management**: `LocaleCubit` in `lib/service/locale_cubit/`

**Usage in Code**:
```dart
AppLocalizations.of(context)?.keyName ?? "Fallback Text"
```

**Persistence**: Locale is saved via `SharedPrefsManager.setLocale()` and loaded on app startup

**Important**: The app forces **LTR (left-to-right) layout** globally via `Directionality` widget in `main.dart`, even for RTL languages.

### Design System

**Responsive Sizing**: Uses `flutter_screenutil` with design base of `428 x 994`:
```dart
SizedBox(height: 36.h, width: 25.w)  // .h for height, .w for width, .r for radius
```

**Color System**: `lib/theme/my_colors.dart`
- Primary: Teal theme (`#01968C`)
- 70+ named colors with semantic naming (e.g., `primaryGreen00A35E`, `gray606060`)

**Typography**: `lib/theme/my_text_styles.dart`
- Font: Plus Jakarta Sans (9 weights from ExtraLight to ExtraBold)
- Access via GetIt: `getIt.get<TextStyleCustom>()`
- 30+ semantic text styles (e.g., `font_48wMedium`, `font_16ww400`)

**Icons**: SVG-based, accessed via `MyIcons.{iconName}` in `lib/theme/my_icons.dart`

### Common Widgets

Reusable components in `lib/common/widget/`:
- **Scaffolds**: `GeneralScaffold`, `SrcGeneralScaffold` (with configurable appbar)
- **Buttons**: `MyElevatedButton`, `MyFloatingButton`
- **Input**: `MyTextField` (with validation)
- **Feedback**: `MySnackbar`, toasts via `fluttertoast`
- **Dashboard**: `SummaryCard`, `StatCard`, `MetricsGrid`, `LabeledProgressBar`
- **Layout**: `BottomSheet`, `CustomDropdown`, `ExpandableStatusCard`, `CommonBlurModal`

## Important Conventions

### File Organization
- **Feature modules are self-contained**: Each role module contains its own models, services, views, and widgets
- **Manager module** uses sub-module pattern: `manager/{home,notifications,reports,tasks}/{models,services,view}`
- **Models** include JSON serialization: `fromJson()` and `toJson()` methods

### Code Style
- **State classes**: Use `copyWith()` pattern for immutable updates
- **Models**: Extend `Equatable` and override `props` getter
- **Widgets**: Prefer `const` constructors where possible
- **Navigation**: Use named routes from `Routes` class
- **API calls**: Check for 401 status (invalid token) using `ResponseExtension` methods

### Error Handling
- API responses use `ApiResponses.returnResponse()` for standardized handling
- Extension methods in `lib/utils/extensions/response_extension.dart` check for invalid tokens
- 15-second timeout on all HTTP requests

### SSL Certificate Handling
- `MyHttpOverrides` in `lib/service/remote/network_api_services.dart` allows all certificates
- Used via `HttpOverrides.global = MyHttpOverrides();` in `main.dart`

## Module-Specific Notes

### Manager Module
Most complex module with hierarchical structure:
- **Home**: Dashboard with stats (`DashboardStats` model)
- **Notifications**: Notification management
- **Reports**: Report generation and viewing
- **Tasks**: Task and alert management

### Order Food Module
- Uses **FilterBloc** for sort/filter state management
- Screens: Dashboard, Menu, Cart, Order Info
- Models and widgets are co-located with screens

### Housekeeping Module
- QR scanner for room check-in (`qr_scanner_screen.dart`)
- Task management and checkout flows
- Mini-bar refill tracking

### Authentication
- Login with employee ID and password
- OTP verification flow
- Role selection after successful login
- Token stored via `SharedPrefsManager`

## Development Notes

### Android Configuration
- **Minimum SDK**: Set in `android/build.gradle`
- **Target SDK**: Updated to latest in `android/build.gradle`
- **Gradle version**: Uses newer Gradle wrapper (see `android/gradle/wrapper/`)
- **App signing**: Configured in `android/app/build.gradle`

### Permissions
Uses `permission_handler: ^11.4.0` for runtime permissions (camera for QR scanning, etc.)

### Known Issues
- QR code scanner package is temporarily disabled in dependencies (see `pubspec.yaml` line 27)
- Repository/Service DI not yet implemented; services are instantiated directly in screens

### Current Branch
Working on `ui-improvements` branch. Base branch for PRs is `main`.

## Adding New Features

When adding a new feature module:

1. **Create feature folder** under `lib/presentation/{feature_name}/`
2. **Organize by layers**:
   - `models/` for data models (with `fromJson`/`toJson`)
   - `services/` for API calls
   - `view/screens/` for screen widgets
   - `view/widgets/` for feature-specific widgets
   - `view/bloc/` if state management is needed
3. **Add routes** to `lib/utils/app_routes/routes.dart`
4. **Use common widgets** from `lib/common/widget/` where possible
5. **Follow naming conventions**:
   - Screens: `{feature}_screen.dart`
   - Models: `{feature}_model.dart`
   - Services: `{feature}_service.dart`
   - BLoCs: `{feature}_bloc.dart`, `{feature}_event.dart`, `{feature}_state.dart`

## Testing

- Test files should mirror the structure in `lib/`
- Place tests in `test/` directory
- Use `flutter_test` package (included by default)
- BLoC testing is facilitated by Equatable for state comparison

## Localization Workflow

1. Add new translation keys to `lib/l10n/intl_en.arb` (base language)
2. Add corresponding translations to other `intl_{locale}.arb` files
3. Run `flutter pub get` to generate localization code
4. Access in code via `AppLocalizations.of(context)?.newKey`
5. Always provide fallback strings with `?? "Fallback Text"`
