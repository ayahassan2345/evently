import 'package:evently/core/constant/l10n/app_localizations.dart';
import '../../../../core/constant/manager/image_manager.dart';
import '../../../../core/widget/main_button.dart';
import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(localization.forgetPass)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 24,
          children: [_buildforgerPassImg(), _buildForgetPassButton(localization)],
        ),
      ),
    );
  }

  MainButton _buildForgetPassButton(AppLocalizations localization) =>
      MainButton(text: localization.resetPassword, onPressed: () {});

  Image _buildforgerPassImg() =>
      Image.asset(ImageManager.forgetPass, height: 361, width: 361);
}
