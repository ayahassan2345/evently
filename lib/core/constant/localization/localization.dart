import 'dart:ui';
import 'package:evently/core/constant/enums/app_language.dart';
import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
final supportedLocales = [
  Locale(AppLanguage.en.name),
  Locale(AppLanguage.ar.name),
];