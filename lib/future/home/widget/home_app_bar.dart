import 'package:evently/core/constant/l10n/app_localizations.dart';
import '../../../core/constant/manager/icon_manager.dart';
import '../../../core/constant/manager/color_manager.dart';
import '../../../core/constant/manager/image_manager.dart';
import '../../../core/widget/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final localization = AppLocalizations.of(context)!;
    final BoxDecoration decoration = BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
    );

    return Container(
      padding: EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 40),
      decoration: decoration,
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildWelcome(textTheme, localization),
                  _buildLocation(textTheme, localization),
                ],
              ),
              _buildThemeAndLang(textTheme, localization),
            ],
          ),
          _buildCategories(context),
        ],
      ),
    );
  }

  Categories _buildCategories(BuildContext context) {
    return Categories(
      borderColor: Theme.of(context).colorScheme.surface,
      selectedBgColor: Theme.of(context).colorScheme.surface,
      unSelectedBgColor: Theme.of(context).colorScheme.secondary,
      selectedIconColor: Theme.of(context).colorScheme.inverseSurface,
      selectedTextColor: Theme.of(context).colorScheme.inverseSurface,
    );
  }

  //Theme.of(context).colorScheme.inverseSurface,
  //
  Row _buildLocation(TextTheme textTheme, AppLocalizations localization) {
    return Row(
      children: [
        Icon(IconManager.locationOnOutlined, size: 25, color: Colors.white),
        Text(
          localization.location,
          style: textTheme.bodyMedium!.copyWith(color: ColorManager.white),
        ),
      ],
    );
  }

  Column _buildWelcome(TextTheme textTheme, AppLocalizations localization) {
    return Column(
      children: [
        Text(
          localization.welcomeBack,
          style: textTheme.bodySmall!.copyWith(color: ColorManager.white),
        ),
        Text(
          localization.userName,
          style: textTheme.titleLarge!.copyWith(color: ColorManager.white),
        ),
      ],
    );
  }

  Row _buildThemeAndLang(TextTheme textTheme, AppLocalizations localization) {
    return Row(
      children: [
        SvgPicture.asset(ImageIconManager.lightTheme, height: 25),
        SizedBox(width: 5),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            minimumSize: Size(30, 40),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            localization.en,
            style: textTheme.bodyLarge!.copyWith(color: ColorManager.primary),
          ),
        ),
      ],
    );
  }
}
