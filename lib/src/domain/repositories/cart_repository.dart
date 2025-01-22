import 'package:food_picker/src/domain/models/cart_item_model/cart_item_model.dart';

abstract class CartRepository {
  Future<void> clearCart();
  Future<List<CartItemModel>> getCartItems();
  Future<void> updateCartList(List<CartItemModel> items);
}