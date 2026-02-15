import '../../../core/constant/manager/color_manager.dart';
import '../../../core/constant/functions/navigation.dart';
import '../../../core/constant/manager/text_manager.dart';
import '../../../core/constant/manager/image_manager.dart';
import '../../../core/main/widgets/main_button.dart';
import '../on_boarding/screen/on_boarding.dart';
import '../../../core/main/widgets/custom_animated_toggle_switch_lang.dart';
import '../../../core/main/widgets/custom_animated_toggle_switch_theme.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bool darkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            spacing: 20,
            children: [
              Expanded(
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildLogo(),
                    _buildImage(darkTheme),
                    _buildTitleAndBody(textTheme),
                    _buildLangAndTheme(context),
                  ],
                ),
              ),
              _buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  MainButton _buildButton(BuildContext context) {
    return MainButton(
      onPressed: () => pushReplacement(context, OnBoarding()),
      text: TextManager.letsStart,
    );
  }

  Column _buildTitleAndBody(TextTheme textTheme) {
    return Column(
      spacing: 20,
      children: [
        Text(
          TextManager.starTilte,
          style: textTheme.titleMedium!.copyWith(color: ColorManager.primary),
        ),
        Text(TextManager.startBody, style: textTheme.headlineSmall),
      ],
    );
  }

  Expanded _buildImage(bool darkTheme) {
    return Expanded(
      child: Image.asset(
        darkTheme ? ImageManager.startDark : ImageManager.startLight,
      ),
    );
  }

  Center _buildLogo() =>
      Center(child: Image.asset(ImageManager.onBoardingLogo));

  Column _buildLangAndTheme(BuildContext context) {
    final style = Theme.of(
      context,
    ).textTheme.titleSmall!.copyWith(color: ColorManager.primary);
    return Column(
      spacing: 20,
      children: [
        Row(
          children: [
            Text(TextManager.language, style: style),
            Spacer(),
            CustomAnimatedToggleSwitchLang(),
          ],
        ),
        Row(
          children: [
            Text(TextManager.theme, style: style),
            Spacer(),
            CustomAnimatedToggleSwitchTheme(),
          ],
        ),
      ],
    );
  }
}
