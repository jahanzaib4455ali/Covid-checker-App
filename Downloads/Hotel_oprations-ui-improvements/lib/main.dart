import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/service/di.dart';
import 'package:kunggy_operational_app/service/locale_cubit/localCubit.dart';
import 'package:kunggy_operational_app/service/remote/network_api_services.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/utils/app_constants/app_context.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';
import 'package:kunggy_operational_app/l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white, // Status bar color
    statusBarIconBrightness: Brightness.dark, // Status bar icons color
    statusBarBrightness: Brightness.light, // For iOS status bar text color
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await setupDI();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 994),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LocaleCubit(),
          ),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: GlobalContext.navigatorKey,
              title: 'Kunggy Operational',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xFF01968C),
                ),
                fontFamily: "Plus Jakarta Sans",
                primarySwatch: MaterialColor(100, MyColors.primarySwatch),
                primaryColor: MyColors.primaryDark1D1929,
                appBarTheme: const AppBarTheme(
                  backgroundColor: MyColors.whiteFFFFFF,
                  elevation: 0,
                ),
                scaffoldBackgroundColor: MyColors.whiteFFFFFF,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.transparent,
                ),
                bottomSheetTheme: const BottomSheetThemeData(
                  backgroundColor: MyColors.whiteFFFFFF,
                ),
                dialogBackgroundColor: MyColors.whiteFFFFFF,
                 checkboxTheme: CheckboxThemeData(
                  splashRadius: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      3,
                    ),
                  ),
                ),
                useMaterial3: true,
              ),
              themeMode: ThemeMode.light,
              initialRoute: Routes.splashScreen,
              routes: Routes.getRoutes,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: state.locale,
              /// This forces LTR layout
              builder: (context, child) {
                return Directionality(
                  textDirection: TextDirection.ltr,
                  child: child!,
                );
              },

            );
          },
        ),
      ),
    );
  }
}
