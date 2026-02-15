import '../widget/profile_button.dart';
import '../widget/profile_app_bar.dart';
import '../widget/select_lang_and_theme.dart';
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
                  SelectLangAndTheme(
                    item1: 'Arabic',
                    item2: 'English',
                    type: 'Language',
                  ),
                  SelectLangAndTheme(
                    item1: 'Light',
                    item2: 'Dark',
                    type: 'Theme',
                  ),
                  Spacer(),
                  SafeArea(
                    top: false,
                    minimum: EdgeInsets.only(bottom: 150),
                    child: ProfileButton(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
