import 'package:device_preview/device_preview.dart';
import 'core/constant/manager/route_manager.dart';
import 'core/constant/theme/theme.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'on_boarding',
      routes: RouteManager.routes,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
