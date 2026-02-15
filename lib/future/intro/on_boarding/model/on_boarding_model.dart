import '../../../../core/constant/manager/image_manager.dart';
import '../../../../core/constant/manager/text_manager.dart';

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


List<OnBoardingModel> onBoardingModel = [
  OnBoardingModel(
    title: TextManager.title1,
    body: TextManager.body1,
    imagePath:ImageManager.onBoarding1
  ),
  OnBoardingModel(
    title: TextManager.title2,
    body: TextManager.body2,
    imagePath: ImageManager.onBoardingLight2
  ),
  OnBoardingModel(
    title: TextManager.title3,
    body: TextManager.body3,
    imagePath: ImageManager.onBoardingLight3
  ),
];
