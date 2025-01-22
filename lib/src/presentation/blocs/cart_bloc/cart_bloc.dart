import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:food_picker/src/domain/models/cart_item_model/cart_item_model.dart';
import 'package:food_picker/src/domain/models/menu_model/menu_model.dart';
import 'package:food_picker/src/domain/repositories/cart_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {

  final CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(CartState.initial()) {
    on<_GetCart>(_getCart);
    on<_AddItem>(_addItem);
    on<_RemoveItem>(_removeItem);
    on<_ClearCart>(_clearCart);
  }

  Future<void> _getCart(_GetCart event, Emitter<CartState> emit) async {
    final cartItems = (await cartRepository.getCartItems());
    emit(state.copyWith(cartItems: cartItems));
  }

  Future<void> _addItem(_AddItem event, Emitter<CartState> emit) async {
    try {
      var itemIndex = state.cartItems.indexWhere((item) => item.dishId == event.item.id);
      if (itemIndex != -1) {
        List<CartItemModel> cartItems = List.from(state.cartItems);
        cartItems[itemIndex] = cartItems[itemIndex].copyWith(quantity: cartItems[itemIndex].quantity + 1);
        await cartRepository.updateCartList(cartItems);
        emit(state.copyWith(cartItems: cartItems));
      } else {
        var cartItems = [...state.cartItems, CartItemModel(dishId: event.item.id, quantity: 1, dish: event.item)];
        await cartRepository.updateCartList(cartItems);
        emit(state.copyWith(cartItems: cartItems));
      }
    }catch(e){
      log(e.toString());
    }
  }

  Future<void> _removeItem(_RemoveItem event, Emitter<CartState> emit) async {
    var itemIndex = state.cartItems.indexWhere((item) => item.dishId == event.item.id);
    if (itemIndex != -1) {
      List<CartItemModel> cartItems = List.from(state.cartItems);
      if (cartItems[itemIndex].quantity == 1) {
        cartItems.removeAt(itemIndex);
        await cartRepository.updateCartList(cartItems);
        emit(state.copyWith(cartItems: cartItems));
      } else {
        cartItems[itemIndex] = cartItems[itemIndex].copyWith(quantity: cartItems[itemIndex].quantity - 1);
        await cartRepository.updateCartList(cartItems);
        emit(state.copyWith(cartItems: cartItems));
      }
    }
  }

  Future<void> _clearCart(_ClearCart event, Emitter<CartState> emit) async {
    await cartRepository.clearCart();
    emit(state.copyWith(cartItems: []));
  }
}
