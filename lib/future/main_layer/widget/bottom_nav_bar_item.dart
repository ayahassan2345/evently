import '../../../core/constant/manager/image_manager.dart';
import '../../../core/constant/manager/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarItemModel {
  final String icon;
  final String activeIcon;
  final String label;

  BottomNavigationBarItemModel({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

List<BottomNavigationBarItemModel> itemModel = [
  BottomNavigationBarItemModel(
    icon: ImageIconManager.unselectedHome,
    activeIcon: ImageIconManager.selectedHome,
    label: TextManager.home,
  ),
  BottomNavigationBarItemModel(
    icon: ImageIconManager.unselectedMap,
    activeIcon: ImageIconManager.selectedMap,
    label: TextManager.map,
  ),
  BottomNavigationBarItemModel(
    icon: ImageIconManager.unselectedLove,
    activeIcon: ImageIconManager.selectedLove,
    label: TextManager.love,
  ),
  BottomNavigationBarItemModel(
    icon: ImageIconManager.unselectedProfile,
    activeIcon: ImageIconManager.selectedProfile,
    label: TextManager.profile,
  ),
];
List<BottomNavigationBarItem> items = itemModel.map((item) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(item.icon),
    activeIcon: SvgPicture.asset(item.activeIcon),
    label: item.label,
  );
}).toList();
