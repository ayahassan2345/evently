import 'package:evently/core/constant/manager/color_manager.dart';
import 'package:flutter/material.dart';

ColorScheme colorSchemeLight = ColorScheme.light(
  primary: ColorManager.white,
  inversePrimary: ColorManager.dark,
  secondary: ColorManager.primary,
  surface: ColorManager.white,
  inverseSurface: ColorManager.primary,
  onSurface: ColorManager.primary,
  background: ColorManager.grey, //image icon txt field prefix
);
ColorScheme colorSchemeDark = ColorScheme.dark(
  primary: ColorManager.dark,
  inversePrimary: ColorManager.white,
  secondary: ColorManager.dark,
  surface: ColorManager.primary,
  inverseSurface: ColorManager.white,
  onSurface: ColorManager.dark,
  background: ColorManager.light,
);
