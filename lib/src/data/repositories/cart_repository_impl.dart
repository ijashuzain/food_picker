import 'package:food_picker/src/core/services/local_storage_services/local_storage_key.dart';
import 'package:food_picker/src/core/services/local_storage_services/local_storage_services.dart';
import 'package:food_picker/src/domain/models/cart_item_model/cart_item_model.dart';
import 'package:food_picker/src/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  @override
  Future<void> clearCart() async {
    await LocalStorage.remove(StorageKey.cartItemsKey);
  }

  @override
  Future<List<CartItemModel>> getCartItems() async {
    var cartItems = await LocalStorage.getMapList(StorageKey.cartItemsKey);
    if (cartItems == null) return [];
    return cartItems.map((e) => CartItemModel.fromJson(e)).toList();
  }

  @override
  Future<void> updateCartList(List<CartItemModel> items) async {
    await LocalStorage.setMapList(StorageKey.cartItemsKey, items.map((e) => e.toJson()).toList());
  }
}
