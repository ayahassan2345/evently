import 'package:evently/core/constant/enums/app_language.dart';
import 'package:evently/core/language_cubit/language_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit()
    : super(
        LanguageState(
          locale: Locale(AppLanguage.en.name),
          selectedValue: AppLanguage.en,
        ),
      );

  void getLanguage(dynamic value) {
    emit(state.copyWith(selectedValue: value));
    if (value == AppLanguage.en) {
      emit(state.copyWith(locale: Locale(AppLanguage.en.name)));
    } else {
      emit(state.copyWith(locale: Locale(AppLanguage.ar.name)));
    }
  }
}
