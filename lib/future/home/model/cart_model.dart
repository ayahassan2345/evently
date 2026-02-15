import '../../../core/constant/manager/image_manager.dart';
import '../../../core/constant/manager/text_manager.dart';

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

List<CartModel> cartModel = [
  CartModel(
    cartImage: ImageManager.bookClub,
    cartMonth: TextManager.cartDate,
    cartDay: TextManager.cartTime,
    carttitle: TextManager.cartTitle,
  ),
  CartModel(
    cartImage: ImageManager.bookClub,
    cartMonth: TextManager.cartDate,
    cartDay: TextManager.cartTime,
    carttitle: TextManager.cartTitle,
  ),
  CartModel(
    cartImage: ImageManager.bookClub,
    cartMonth: TextManager.cartDate,
    cartDay: TextManager.cartTime,
    carttitle: TextManager.cartTitle,
  ),
  CartModel(
    cartImage: ImageManager.bookClub,
    cartMonth: TextManager.cartDate,
    cartDay: TextManager.cartTime,
    carttitle: TextManager.cartTitle,
  ),
];
