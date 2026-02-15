import '../manager/color_manager.dart';
import 'package:flutter/material.dart';

BottomAppBarThemeData bottomAppBarhemeLight = BottomAppBarThemeData(
  padding: EdgeInsets.only(top: 5),
  color: ColorManager.primary,
  shape: CircularNotchedRectangle(),
);

BottomAppBarThemeData bottomAppBarhemeDark = BottomAppBarThemeData(
  padding: EdgeInsets.only(top: 5),
  color: ColorManager.dark,
  shape: CircularNotchedRectangle(),
);
