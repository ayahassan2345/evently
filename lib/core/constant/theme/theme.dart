import 'package:evently/core/constant/theme/color_scheme.dart';

import '../manager/color_manager.dart';
import 'app_bar_theme.dart';
import 'bottom_app_bar_theme.dart';
import 'bottom_navigation_bar_theme.dart';
import 'elevated_button_theme.dart';
import 'floating_action_button_theme.dart';
import 'input_decoration_theme.dart';
import 'text_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: colorSchemeLight,
  // iconTheme: IconThemeData(color: ColorManager.grey),

  fontFamily: 'Inter',
  scaffoldBackgroundColor: ColorManager.white,
  elevatedButtonTheme: elevatedButtonTheme,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  hoverColor: Colors.transparent,
  appBarTheme: appBarThemeLight,
  textTheme: textThemeLight,
  bottomAppBarTheme: bottomAppBarhemeLight,
  bottomNavigationBarTheme: bottomNavigationBarThemeLight,
  floatingActionButtonTheme: floatingActionButtonThemeLight,
  inputDecorationTheme: inputDecorationThemeLight,
  // useMaterial3: false,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: colorSchemeDark,
  // iconTheme: IconThemeData(color: ColorManager.white),
  fontFamily: 'Inter',
  scaffoldBackgroundColor: ColorManager.dark,
  elevatedButtonTheme: elevatedButtonTheme,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  hoverColor: Colors.transparent,
  appBarTheme: appBarThemeDark,
  textTheme: textThemeDark,
  bottomAppBarTheme: bottomAppBarhemeDark,
  bottomNavigationBarTheme: bottomNavigationBarThemeDark,
  floatingActionButtonTheme: floatingActionButtonThemeDark,
  inputDecorationTheme: inputDecorationThemeDark,
);
