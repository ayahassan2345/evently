import 'package:evently/core/constant/enums/app_language.dart';
import 'package:flutter/material.dart';

class LanguageState {
  final Locale locale; //en - ar
final AppLanguage  selectedValue;
  LanguageState({required this.locale, required this.selectedValue});

  LanguageState copyWith({Locale? locale, AppLanguage? selectedValue}) {
    return LanguageState(
      locale: locale ?? this.locale,
      selectedValue: selectedValue ?? this.selectedValue,
    );
  }
}
