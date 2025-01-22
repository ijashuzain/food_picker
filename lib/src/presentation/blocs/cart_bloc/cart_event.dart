part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.getCart() = _GetCart;
  const factory CartEvent.clearCart() = _ClearCart;
  const factory CartEvent.removeItem(DishModel item) = _RemoveItem;
  const factory CartEvent.addItem(DishModel item) = _AddItem;
}
