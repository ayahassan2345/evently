import 'dart:developer';
import 'package:evently/core/config/bloc/theme_lang_state.dart';
import 'package:evently/core/constant/enums/app_language.dart';
import 'package:evently/core/services/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeLangCubit extends Cubit<ThemeLangState> {
  ThemeLangCubit() : super(ThemeLangState());
  ThemeMode selectedTheme = ThemeMode.system;
  AppLanguage selectedLanguage = AppLanguage.en;

  void onChangeTheme({required dynamic value}) {
    selectedTheme = value;
    emit(ChangeThemeState());
    SharedPrefs.setAppTheme(selectedTheme: selectedTheme);
  }

  ThemeMode? getAppTheme() {
    log(SharedPrefs.getAppTheme().toString());
    return SharedPrefs.getAppTheme() ?? ThemeMode.system;
  }

  void onChangeLanguage(dynamic value) {
    selectedLanguage = value;
    emit(ChangeLanguageState());
    SharedPrefs.setAppLanguage(selectedLanguage: selectedLanguage);
  }

  String? getAppLanguage() {
    return SharedPrefs.getAppLanguage() ?? AppLanguage.en.name;
  }
}
