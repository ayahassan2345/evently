import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import '../constant/manager/image_manager.dart';

class CategoriesModel {
  final String categoryName;
  final String categoryIcon;
  CategoriesModel({required this.categoryName, required this.categoryIcon});

  // CategoriesModel copyWith({String? categoryName, String? categoryIcon}) {
  //   return CategoriesModel(
  //     categoryIcon: categoryName ?? this.categoryName,
  //     categoryName: categoryIcon ?? this.categoryIcon,
  //   );
  // }
}

List<CategoriesModel> getCategoriesModel({required BuildContext context}) {
  final localization = AppLocalizations.of(context)!;
  return [
    CategoriesModel(
      categoryName: localization.all,
      categoryIcon: ImageIconManager.all,
    ),
    CategoriesModel(
      categoryName: localization.sport,
      categoryIcon: ImageIconManager.sport,
    ),
    CategoriesModel(
      categoryName: localization.birthday,
      categoryIcon: ImageIconManager.birethday,
    ),
    CategoriesModel(
      categoryName: localization.sport,
      categoryIcon: ImageIconManager.sport,
    ),
  ];
}
