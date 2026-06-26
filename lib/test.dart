import 'package:evently/core/services/shared_prefs.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Map<String, String>? data;
  @override
  void initState() {
    data = SharedPrefs.getProfileUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data?["email"] ?? "no  email"),
            Text(data?["userName"] ?? "no  userName"),
          ],
        ),
      ),
    );
  }
}
///theme-language -state/cache
///firebase auth
///firestore create event
///handle application logout
///session firestore