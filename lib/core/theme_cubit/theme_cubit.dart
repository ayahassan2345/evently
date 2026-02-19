import 'package:evently/core/constant/enums/app_theme.dart';
import 'package:evently/core/constant/theme/theme.dart';
import 'package:evently/core/theme_cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(ThemeState(theme: lightTheme, selectedValue: AppTheme.light));

  void getTheme(dynamic value) {
    emit(state.copyWith(selectedValue: value));
    if (value == AppTheme.light) {
      emit(state.copyWith(theme: lightTheme));
    } else {
      emit(state.copyWith(theme: darkTheme));
    }
  }
}

// 9SharedPreferences
Widget _buildButton() {
  return Column(
    children: [
      ElevatedButton(
        onPressed: () async {
          String? name;
          final sharedPrefrences = await SharedPreferences.getInstance();
          sharedPrefrences.setString('name', 'aya');
          final getVal = sharedPrefrences.getString('name');
        },
        child: Text('data'),
      ),
    ],
  );
}
