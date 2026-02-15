import '../manager/color_manager.dart';
import 'text_theme.dart';
import 'package:flutter/material.dart';

AppBarTheme appBarThemeLight = AppBarTheme(
  titleTextStyle: textThemeLight.headlineLarge!.copyWith(
    color: ColorManager.primary,
  ),
  backgroundColor: ColorManager.white,
  surfaceTintColor: ColorManager.transparent,
  centerTitle: true,
  iconTheme: IconThemeData(color: ColorManager.primary),
  actionsIconTheme: IconThemeData(),
);

AppBarTheme appBarThemeDark = AppBarTheme(
  titleTextStyle: textThemeLight.headlineLarge!.copyWith(
    color: ColorManager.primary,
  ),
  backgroundColor: ColorManager.dark,
  surfaceTintColor: ColorManager.transparent,
  centerTitle: true,
  iconTheme: IconThemeData(color: ColorManager.primary),
  actionsIconTheme: IconThemeData(),
);
