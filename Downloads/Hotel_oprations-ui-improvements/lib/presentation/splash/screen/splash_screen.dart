import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/service/di.dart';
import 'package:kunggy_operational_app/service/locale_cubit/localCubit.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_constants/app_constants.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';
import 'package:kunggy_operational_app/utils/shared_pref_manager/shared_pref.dart';


import '../../../l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    getData();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, Routes.loginScreen);
    });
  }

  Future getData() async {
    final locale = await getIt<SharedPrefsManager>().getLocale();
    AppConstants.selectedLanguage = locale;
    BlocProvider.of<LocaleCubit>(context)

        .setLocale(Locale(AppConstants.selectedLanguage));

    //   final position = await determinePosition();
    //   print(position);
    //   lat = position.latitude;
    //   lng = position.longitude;
    //   address = await getAddressFromLatLng();
    //   print("address$address");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryDark1D1929,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextView(
              AppLocalizations.of(context)?.kunggy ?? "Kunggy",
              style: myTextStyle.font_10w400.copyWith(
                fontSize: 55,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextView(
              AppLocalizations.of(context)?.pmsOperations ?? "PMS Operations",
              style: myTextStyle.font_10w400.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
