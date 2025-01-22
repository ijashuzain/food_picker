import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_picker/src/domain/models/cart_item_model/cart_item_model.dart';
import 'package:food_picker/src/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class OrderedDishWidget extends StatelessWidget {
  const OrderedDishWidget({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    var total = double.parse(cartItem.dish.price) * cartItem.quantity;
    return Container(
      padding: EdgeInsets.all(16.dp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.dp),
            child: Container(
              height: 20.dp,
              width: 20.dp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.dp),
              ),
              child: Image.asset(
                "assets/images/non_veg.png",
              ),
            ),
          ),
          Gap(12.dp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  cartItem.dish.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Gap(12.dp),
                Text(
                  "${cartItem.dish.currency} ${cartItem.dish.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  "${cartItem.dish.calories} Calories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.end,
                ),
                Gap(12.dp),
              ],
            ),
          ),
          Gap(8.dp),
          Container(
            width: 98.dp,
            height: 35.dp,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(56.dp),
            ),
            child: Row(
              children: [
                Gap(10.dp),
                GestureDetector(
                  onTap: () {
                    context.read<CartBloc>().add(CartEvent.addItem(cartItem.dish));
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18.dp,
                  ),
                ),
                Spacer(),
                BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  var index = state.cartItems.indexWhere((element) => element.dishId == cartItem.dishId);
                  var quantity = index != -1 ? state.cartItems[index].quantity : 0;
                  return Text(
                    quantity.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  );
                }),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    context.read<CartBloc>().add(CartEvent.removeItem(cartItem.dish));
                  },
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 18.dp,
                  ),
                ),
                Gap(10.dp),
              ],
            ),
          ),
          Gap(8.dp),
          SizedBox(
            height: 68.dp,
            width: 68.dp,
            child: Text(
              "${cartItem.dish.currency} ${total.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}