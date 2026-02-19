import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constant/manager/image_manager.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarItemModel {
  final String icon;
  final String activeIcon;
  final String label;

  BottomNavigationBarItemModel({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
  BottomNavigationBarItem itemBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon),
      activeIcon: SvgPicture.asset(activeIcon),
      label: label,
    );
  }

}

List<BottomNavigationBarItemModel> itemModel(BuildContext context) {
  final localization = AppLocalizations.of(context)!;
  return [
    BottomNavigationBarItemModel(
      icon: ImageIconManager.unselectedHome,
      activeIcon: ImageIconManager.selectedHome,
      label: localization.home,
    ),
    BottomNavigationBarItemModel(
      icon: ImageIconManager.unselectedMap,
      activeIcon: ImageIconManager.selectedMap,
      label: localization.map,
    ),
    BottomNavigationBarItemModel(
      icon: ImageIconManager.unselectedLove,
      activeIcon: ImageIconManager.selectedLove,
      label: localization.love,
    ),
    BottomNavigationBarItemModel(
      icon: ImageIconManager.unselectedProfile,
      activeIcon: ImageIconManager.selectedProfile,
      label: localization.profile,
    ),
  ];
}
