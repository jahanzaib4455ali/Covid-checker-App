import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/shared_pref_manager/shared_pref.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

setupDI() async {
  // AppRoutes initialization
  // getIt.registerLazySingleton<AppRoutes>(() => AppRoutes());

  // Package Infromation Plus
  // final packageInfo = await PackageInfo.fromPlatform();
  // getIt.registerLazySingleton(() => packageInfo);

  // Shared Preference Instance
  final pref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => pref);

  // Register Shared Pref Manager that depends on SharedPreferences
  getIt.registerLazySingleton(() => SharedPrefsManager(getIt.get()));

  // ApiServices
  // getIt.registerLazySingleton(() => ApiService(getIt.get()));

  // Api Repository
  //getIt.registerLazySingleton(() => ApiRepository(getIt.get()));

  getIt.registerLazySingleton<TextStyleCustom>(() => TextStyleCustom());

  // Api Repository
  // getIt.registerLazySingleton(() => HomeViewModel(getIt.get()));

  // Font Family Name
  // String aeonik = 'aeonik';
  // getIt.registerSingleton<String>(aeonik, instanceName: 'f1');
}
