import '../manager/color_manager.dart';
import 'package:flutter/material.dart';

BottomNavigationBarThemeData bottomNavigationBarThemeLight =
    BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      selectedItemColor: ColorManager.white,
      unselectedItemColor: ColorManager.white,
    );

BottomNavigationBarThemeData bottomNavigationBarThemeDark =
    BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorManager.dark,
      selectedItemColor: ColorManager.white,
      unselectedItemColor: ColorManager.white,
    );
