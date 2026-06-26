import 'package:evently/future/profile/widget/profile_app_bar.dart';
import 'package:evently/future/profile/widget/profile_button.dart';
import 'package:evently/future/profile/widget/theme_widget.dart';
import 'package:evently/future/profile/widget/language_widget.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileAppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                spacing: 10,
                children: [
                  ThemeWidget(),
                  LanguageWidget(),
                  Spacer(),
                  _buildLogoutButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SafeArea _buildLogoutButton() {
    return SafeArea(
      top: false,
      minimum: EdgeInsets.only(bottom: 150),
      child: LogoutButton(),
    );
  }
}
