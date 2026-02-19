import 'package:evently/core/constant/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import '../../../core/constant/manager/image_manager.dart';

class CartModel {
  final String cartImage;
  final String cartMonth;
  final String cartDay;
  final String carttitle;

  CartModel({
    required this.cartImage,
    required this.cartMonth,
    required this.cartDay,
    required this.carttitle,
  });
}

List<CartModel> getCartModel(BuildContext context) {
  final localization = AppLocalizations.of(context)!;
  return [
    CartModel(
      cartImage: ImageManager.bookClub,
      cartMonth: localization.cartDate,
      cartDay: localization.cartTime,
      carttitle: localization.cartTitle,
    ),
    CartModel(
      cartImage: ImageManager.bookClub,
      cartMonth: localization.cartDate,
      cartDay: localization.cartTime,
      carttitle: localization.cartTitle,
    ),
    CartModel(
      cartImage: ImageManager.bookClub,
      cartMonth: localization.cartDate,
      cartDay: localization.cartTime,
      carttitle: localization.cartTitle,
    ),
    CartModel(
      cartImage: ImageManager.bookClub,
      cartMonth: localization.cartDate,
      cartDay: localization.cartTime,
      carttitle: localization.cartTitle,
    ),
  ];
}
