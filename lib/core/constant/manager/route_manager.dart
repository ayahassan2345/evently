import '../../../future/event_detail/event_detail.dart';
import '../../../future/create_event/screen/create_event.dart';
import '../../../future/auth/login/screen/log_in.dart';
import '../../../future/auth/password/screen/password.dart';
import '../../../future/auth/register/screen/register.dart';
import '../../../future/home/screen/home.dart';
import '../../../future/intro/splash/splash.dart';
import '../../../future/profile/screen/profile.dart';
import '../../../future/main_layer/screen/main_layer.dart';
import '../../../future/intro/on_boarding/screen/on_boarding.dart';
import '../../../future/intro/start/start.dart';
import '../../../future/search/screen/event_search.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static Map<String, WidgetBuilder> routes = {
    'home': (BuildContext context) => Home(),
    'splash': (BuildContext context) => Splash(),
    'start': (BuildContext context) => Start(),
    'on_boarding': (BuildContext context) => OnBoarding(),
    'log_in': (BuildContext context) => LogIn(),
    'register': (BuildContext context) => Register(),
    'password': (BuildContext context) => Password(),
    'profile': (BuildContext context) => Profile(),
    'create_event': (BuildContext context) => CreateEvent(),
    'event_detail': (BuildContext context) => EventDetail(),
    'main_layer': (BuildContext context) => MainLayer(),
    'search': (BuildContext context) => EventSearch(),
  };
}
