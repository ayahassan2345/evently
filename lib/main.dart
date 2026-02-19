import 'package:device_preview/device_preview.dart';
import 'package:evently/core/constant/localization/localization.dart';
import 'package:evently/core/language_cubit/language_cubit.dart';
import 'package:evently/core/language_cubit/language_state.dart';
import 'package:evently/core/theme_cubit/theme_cubit.dart';
import 'package:evently/core/theme_cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constant/manager/route_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(builder: (context) => Evently(), isToolbarVisible: false),
  );
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return ThemeCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return LanguageCubit();
          },
        ),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: 'main_layer',
                routes: RouteManager.routes,
                theme: themeState.theme,
                locale: languageState.locale,
                localizationsDelegates: localizationsDelegates,
                supportedLocales: supportedLocales,
              );
            },
          );
        },
      ),
    );
  }
}
