import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/constant/manager/image_manager.dart';

class OnBoardingModel {
  final String title;
  final String body;
  final String imagePath;

  OnBoardingModel({
    required this.title,
    required this.body,
    required this.imagePath,
  });
}

List<OnBoardingModel> getOnBoardingModel(BuildContext context) {
  final localization = AppLocalizations.of(context)!;
  return [
    OnBoardingModel(
      title: localization.title1,
      body: localization.body1,
      imagePath: ImageManager.onBoarding1,
    ),
    OnBoardingModel(
      title: localization.title2,
      body: localization.body2,
      imagePath: ImageManager.onBoardingLight2,
    ),
    OnBoardingModel(
      title: localization.title3,
      body: localization.body3,
      imagePath: ImageManager.onBoardingLight3,
    ),
  ];
}
