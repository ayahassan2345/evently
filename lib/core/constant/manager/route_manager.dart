import 'package:evently/future/auth/presentation/screen/register/bloc/register_cubit.dart';
import 'package:evently/future/search/screen/event_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../future/event_detail/event_detail.dart';
import '../../../create_event/presentation/screen/create_event.dart';
import '../../../future/auth/presentation/screen/login/screen/log_in.dart';
import '../../../future/auth/password/screen/password.dart';
import '../../../future/auth/presentation/screen/register/screen/register.dart';
import '../../../home/presentation/screen/home.dart';
import '../../../future/intro/splash/splash.dart';
import '../../../future/profile/screen/profile.dart';
import '../../../future/tabs/tabs.dart';
import '../../../future/intro/on_boarding/screen/on_boarding.dart';
import '../../../future/intro/start/start.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static Map<String, WidgetBuilder> routes = {
    'home': (BuildContext context) => Home(),
    'splash': (BuildContext context) => Splash(),
    'start': (BuildContext context) => Start(),
    'on_boarding': (BuildContext context) => OnBoarding(),
    'log_in': (BuildContext context) => LogIn(),
    'register': (BuildContext context) => BlocProvider(
      create: (context) {
        return RegisterCubit();
      },
      child: Register(),
    ),
    'password': (BuildContext context) => Password(),
    'profile': (BuildContext context) => Profile(),
    'create_event': (BuildContext context) => CreateEvent(),
    'event_detail': (BuildContext context) => EventDetail(),
    'main_layer': (BuildContext context) => Tabs(),
    'search': (BuildContext context) => Search(),
  };
}
