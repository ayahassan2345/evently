import 'package:evently/core/constant/l10n/app_localizations.dart';
import '../../../core/constant/manager/icon_manager.dart';
import '../../../core/constant/manager/color_manager.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final localization = AppLocalizations.of(context)!;
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Color(0XFFFF5659),
          side: BorderSide(color: ColorManager.transparent),
        ),
        child: Row(
          spacing: 10,
          children: [
            Icon(IconManager.logout, color: Colors.white, size: 25),
            Text(
              localization.logout,
              style: textTheme.headlineLarge!.copyWith(
                color: ColorManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
