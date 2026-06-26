import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import '../constant/manager/image_manager.dart';

class CategoriesModel {
  final String categoryName;
  final String categoryIcon;

  CategoriesModel({required this.categoryName, required this.categoryIcon});

  CategoriesModel copyWith({String? categoryName, String? categoryIcon}) {
    return CategoriesModel(
      categoryName: categoryName ?? this.categoryName,
      categoryIcon: categoryIcon ?? this.categoryIcon,
    );
  }

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      categoryName: json['categoryName'],
      categoryIcon: json['categoryIcon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'categoryName': categoryName, 'categoryIcon': categoryIcon};
  }
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
      categoryName: 'meeting',
      categoryIcon: ImageIconManager.sport,
    ),
    CategoriesModel(
      categoryName: 'gaming',
      categoryIcon: ImageIconManager.sport,
    ),
    CategoriesModel(
      categoryName: 'eating',
      categoryIcon: ImageIconManager.sport,
    ),
    CategoriesModel(
      categoryName: 'holiday',
      categoryIcon: ImageIconManager.sport,
    ),
    CategoriesModel(
      categoryName: 'exhibition',
      categoryIcon: ImageIconManager.sport,
    ),
    CategoriesModel(
      categoryName: 'workshop',
      categoryIcon: ImageIconManager.sport,
    ),
    CategoriesModel(
      categoryName: 'bookclub',
      categoryIcon: ImageIconManager.sport,
    ),
  ];
}
