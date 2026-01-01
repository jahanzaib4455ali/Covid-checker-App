

extension InvalidTokenExtension on Map<String, dynamic> {
  bool hasInvalidToken() {
    return containsKey('status') &&
        this['status'] != null &&
        this['status'] == 401;
  }

  void onInvalidToken() async {
    // MySnackbar.showSnackbar(this['message']);
    //SharedPrefsManager prefManager = getIt<SharedPrefsManager>();
    //await prefManager.removeUserToken();
   // GlobalContext.currentContext!.pushNamedAndRemoveUntil(Routes.loginScreen);
  }
}
