import '../manager/color_manager.dart';
import 'package:flutter/material.dart';

FloatingActionButtonThemeData floatingActionButtonThemeLight =
    FloatingActionButtonThemeData(
      backgroundColor: ColorManager.primary,
      elevation: 0,
      shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 3)),
    );
FloatingActionButtonThemeData floatingActionButtonThemeDark =
    FloatingActionButtonThemeData(
      backgroundColor: ColorManager.dark,
      elevation: 0,
      shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 3)),
    );
