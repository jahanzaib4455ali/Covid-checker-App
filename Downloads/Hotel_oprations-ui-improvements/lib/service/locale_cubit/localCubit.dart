import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/service/di.dart';
import 'package:kunggy_operational_app/utils/app_constants/app_constants.dart';
import 'package:kunggy_operational_app/utils/shared_pref_manager/shared_pref.dart';
import 'package:kunggy_operational_app/l10n/app_localizations.dart';


// Define the state for the LocaleCubit
class LocaleState extends Equatable {
  final Locale locale;

  const LocaleState(this.locale);

  @override
  List<Object> get props => [locale];
}

// Define the Cubit
class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleState(Locale('en')));

  Future<void> setLocale(Locale locale) async {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    await getIt<SharedPrefsManager>().setLocale(locale.toString());
    AppConstants.selectedLanguage = locale.toString();
    emit(LocaleState(locale));
  }
}
