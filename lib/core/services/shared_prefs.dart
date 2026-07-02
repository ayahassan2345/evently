import 'dart:developer';
import 'package:evently/core/constant/enums/app_language.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void clearData() {
    prefs.clear();
  }

  static void setUserData({
    required String uid,
    required String email,
    required String userName,
  }) {
    prefs.setString('uid', uid);
    prefs.setString('email', email);
    prefs.setString('userName', userName);
  }

  static String getUserid() {
    return prefs.getString('uid') ?? '';
  }

  static Map<String, String>? getProfileUserData() {
    String? email = prefs.getString('email');
    String? username = prefs.getString('userName');
    if (email == null || username == null) {
      log('email : $email , name: $username');
      return null;
    } else {
      log('email : $email , name: $username');
      return {'email': email, 'userName': username};
    }
  }

  static void setAppTheme({required ThemeMode selectedTheme}) {
    String theme = selectedTheme.name;
    prefs.setString('theme_key', theme);
  }

  static ThemeMode? getAppTheme() {
    String theme = prefs.getString('theme_key') ?? '';
    if (theme == ThemeMode.light.name) {
      return ThemeMode.light; //lightTheme
    }
    if (theme == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  static void setAppLanguage({required AppLanguage selectedLanguage}) {
    String language = selectedLanguage.name; //en-ar
    prefs.setString('lang_key', language);
  }

  static String? getAppLanguage() {
    return prefs.getString('lang_key') ?? AppLanguage.en.name;
  }
}
