import 'package:evently/core/constant/enums/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData theme; //light -dark
  final AppTheme selectedValue;
  ThemeState({required this.theme, required this.selectedValue});

  ThemeState copyWith({ThemeData? theme, AppTheme? selectedValue}) {
    return ThemeState(
      theme: theme ?? this.theme,
      selectedValue: selectedValue ?? this.selectedValue,
    );
  }
}
