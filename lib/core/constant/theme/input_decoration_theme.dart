import '../manager/color_manager.dart';
import 'text_theme.dart';
import 'package:flutter/material.dart';

final OutlineInputBorder borderLight = OutlineInputBorder(
  borderSide: BorderSide(color: ColorManager.grey),
  borderRadius: BorderRadius.circular(16),
);
final OutlineInputBorder borderDark = OutlineInputBorder(
  borderSide: BorderSide(color: ColorManager.primary),
  borderRadius: BorderRadius.circular(16),
);
InputDecorationTheme inputDecorationThemeLight = InputDecorationTheme(
  enabledBorder: borderLight,
  focusedBorder: borderLight,
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: ColorManager.error),
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  hintStyle: textThemeLight.headlineSmall!.copyWith(color: ColorManager.grey),
  suffixIconColor: ColorManager.grey,
  prefixIconColor: ColorManager.grey,
  focusedErrorBorder: borderLight,
  errorStyle: textThemeDark.bodySmall!.copyWith(color: ColorManager.error),
);

InputDecorationTheme inputDecorationThemeDark = InputDecorationTheme(
  enabledBorder: borderDark,
  focusedBorder: borderDark,
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: ColorManager.error),
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  hintStyle: textThemeDark.headlineSmall,
  suffixIconColor: ColorManager.white,
  prefixIconColor: ColorManager.white,
  focusedErrorBorder: borderDark,
  errorStyle: textThemeDark.bodySmall!.copyWith(color: ColorManager.error),
);
