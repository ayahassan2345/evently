import '../../../core/constant/manager/icon_manager.dart';
import '../../../core/constant/manager/color_manager.dart';
import '../../../core/constant/manager/image_manager.dart';
import '../../../core/constant/manager/text_manager.dart';
import '../../../core/main/widgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                children: [_buildWelcome(textTheme), _buildLocation(textTheme)],
              ),
              _buildThemeAndLang(textTheme),
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
  Row _buildLocation(TextTheme textTheme) {
    return Row(
      children: [
        Icon(IconManager.locationOnOutlined, size: 25, color: Colors.white),
        Text(
          TextManager.location,
          style: textTheme.bodyMedium!.copyWith(color: ColorManager.white),
        ),
      ],
    );
  }

  Column _buildWelcome(TextTheme textTheme) {
    return Column(
      children: [
        Text(
          TextManager.welcomeBack,
          style: textTheme.bodySmall!.copyWith(color: ColorManager.white),
        ),
        Text(
          TextManager.userName,
          style: textTheme.titleLarge!.copyWith(color: ColorManager.white),
        ),
      ],
    );
  }

  Row _buildThemeAndLang(TextTheme textTheme) {
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
            TextManager.en,
            style: textTheme.bodyLarge!.copyWith(color: ColorManager.primary),
          ),
        ),
      ],
    );
  }
}
