import '../../constant/manager/image_manager.dart';
import '../../constant/manager/text_manager.dart';

class CategoriesModel {
  final String categoryName;
  final String categoryIcon;
  CategoriesModel({required this.categoryName, required this.categoryIcon});

  CategoriesModel copyWith({String? categoryName, String? categoryIcon}) {
    return CategoriesModel(
      categoryIcon: categoryName ?? this.categoryName,
      categoryName: categoryIcon ?? this.categoryIcon,
    );
  }
}

List<CategoriesModel> categoriesModel = [
  CategoriesModel(
    categoryName: TextManager.all,
    categoryIcon: ImageIconManager.all,
  ),
  CategoriesModel(
    categoryName: TextManager.sport,
    categoryIcon: ImageIconManager.sport,
  ),
  CategoriesModel(
    categoryName: TextManager.birthday,
    categoryIcon: ImageIconManager.birethday,
  ),
  CategoriesModel(
    categoryName: TextManager.sport,
    categoryIcon: ImageIconManager.sport,
  ),
];

