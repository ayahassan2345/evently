import 'package:evently/core/config/bloc/theme_lang_cubit.dart';
import 'package:evently/core/config/bloc/theme_lang_state.dart';
import 'package:evently/core/constant/enums/app_language.dart';
import 'package:evently/core/constant/localization/localization.dart';
import 'package:evently/core/constant/theme/theme.dart';
import 'package:evently/core/services/shared_prefs.dart';
import 'package:evently/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constant/manager/route_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefs.init();
  runApp(Evently());
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ThemeLangCubit();
      },
      child: BlocBuilder<ThemeLangCubit, ThemeLangState>(
        builder: (context, themeState) {
          var cubit = context.read<ThemeLangCubit>();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: 'main_layer',
            routes: RouteManager.routes,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.getAppTheme() ?? ThemeMode.system,
            locale: Locale(cubit.getAppLanguage() ?? AppLanguage.en.name),
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
          );
        },
      ),
    );
  }
}
