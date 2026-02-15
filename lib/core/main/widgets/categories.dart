import 'package:evently/core/constant/manager/color_manager.dart';

import '../model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatefulWidget {
  const Categories({
    super.key,
    required this.borderColor,
    required this.selectedIconColor,
    required this.selectedTextColor,
    required this.selectedBgColor,
    required this.unSelectedBgColor,
    this.unSelectedIconColor,
    this.unSelectedTextColor,
  });
  final Color borderColor;
  final Color selectedIconColor;
  final Color selectedTextColor;
  final Color selectedBgColor;
  final Color unSelectedBgColor;
  final Color? unSelectedIconColor;
  final Color? unSelectedTextColor;

  @override
  State<Categories> createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
        itemCount: categoriesModel.length,
        itemBuilder: (context, index) {
          final model = categoriesModel[index];
          return _buildCategories(index, model);
        },
      ),
    );
  }

  InkWell _buildCategories(int index, CategoriesModel model) {
    final BoxDecoration decoration = BoxDecoration(
      color: isSelected == index
          ? widget.selectedBgColor
          : widget.unSelectedBgColor,
      borderRadius: BorderRadius.circular(46),
      border: BoxBorder.all(color: widget.borderColor, width: 1.5),
    );
    return InkWell(
      onTap: () => setState(() => isSelected = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: decoration,
        child: Row(
          children: [
            SvgPicture.asset(
              model.categoryIcon,
              colorFilter: ColorFilter.mode(
                isSelected == index
                    ? widget.selectedIconColor
                    : widget.unSelectedIconColor ?? ColorManager.white,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 4),
            Text(
              model.categoryName,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: isSelected == index
                    ? widget.selectedTextColor
                    : widget.unSelectedTextColor ?? ColorManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
