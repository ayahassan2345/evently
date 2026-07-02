import '../manager/color_manager.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: ColorManager.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    
    side: BorderSide(color: ColorManager.primary),
  ),
);
