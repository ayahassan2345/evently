import '../manager/color_manager.dart';
import 'text_theme.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: ColorManager.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    textStyle: textThemeDark.titleSmall,
    foregroundColor: ColorManager.white,
    side: BorderSide(color: ColorManager.primary),
  ),
);
