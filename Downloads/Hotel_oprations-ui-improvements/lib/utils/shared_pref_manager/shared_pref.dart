import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  final SharedPreferences _sharedPreferences;

  SharedPrefsManager(this._sharedPreferences);

  // Save data to shared preferences
  Future<void> saveData(String key, dynamic value) async {
    if (value is String) {
      await _sharedPreferences.setString(key, value);
    } else if (value is int) {
      await _sharedPreferences.setInt(key, value);
    } else if (value is double) {
      await _sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    }
    // Add more cases for other data types if needed
  }

  // Get data from shared preferences
  dynamic getData(String key) {
    return _sharedPreferences.get(key);
  }

  // LoginResponse getUser() {
  //   String? token = _sharedPreferences.getString(LoginResponse.tokenKey);
  //   String? name = _sharedPreferences.getString(LoginResponse.nameKey);
  //   String? email = _sharedPreferences.getString(LoginResponse.emailKey);
  //   String? id = _sharedPreferences.getString(LoginResponse.idKey);

  //   LoginResponse user = LoginResponse(
  //     email: email,
  //     isActive: null,
  //     isVerified: null,
  //     accessToken: token,
  //     message: "",
  //     name: name,
  //     id: id,
  //   );

  //   return user;
  // }

  // Future<void> saveUser(LoginResponse user) async {
  //   registerUserInDependency(user);
  //   await _sharedPreferences.setString(
  //       LoginResponse.tokenKey, user.accessToken!);
  //   String name = user.name ?? user.email!.split("@").first;

  //   await _sharedPreferences.setString(
  //     LoginResponse.nameKey,
  //     name.capitalizeFirst(),
  //   );
  //   await _sharedPreferences.setString(
  //       LoginResponse.emailKey, user.email ?? "");
  //   await _sharedPreferences.setString(LoginResponse.idKey, user.id ?? "");
  //   ApiHeaders.userAccessToken = user.accessToken!;
  // }

  // Future<void> removeUserToken() async {
  //   await _sharedPreferences.remove(LoginResponse.tokenKey);
  // }

  // void registerUserInDependency(LoginResponse user) {
  //   try {
  //     GetIt.instance.registerSingleton<LoginResponse>(user);
  //   } catch (e) {
  //     GetIt.instance.unregister<LoginResponse>();
  //     GetIt.instance.registerSingleton<LoginResponse>(user);
  //   }
  // }

  Future<void> setLocale(String languageCode) async {
    await _sharedPreferences.setString("locale", languageCode);
  }

  Future<String> getLocale() async {
    String storedLangCode = _sharedPreferences.getString("locale") ?? 'en';

    return storedLangCode;
  }
}
