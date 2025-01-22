import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_picker/src/domain/models/menu_model/menu_model.dart';
import 'package:food_picker/src/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class DishWidget extends StatelessWidget {
  const DishWidget({
    super.key,
    required this.dish,
  });

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
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
                  dish.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Gap(4.dp),
                Row(
                  children: [
                    Text(
                      "${dish.currency} ${dish.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${dish.calories} Calories",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Gap(12.dp),
                Text(
                  "${dish.description}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.sp,
                  ),
                ),
                Gap(12.dp),
                Container(
                  width: 120.dp,
                  height: 42.dp,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(56.dp),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(CartEvent.addItem(dish));
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      BlocBuilder<CartBloc, CartState>(
                          builder: (context,state) {
                            var index = state.cartItems.indexWhere((element) => element.dishId == dish.id);
                            var  quantity = index != -1 ? state.cartItems[index].quantity : 0;
                            return Text(
                              quantity.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            );
                          }
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(CartEvent.removeItem(dish));
                        },
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Gap(12.dp),
                if (dish.customizationsAvailable) Text("Customizations Available", style: TextStyle(color: Colors.redAccent, fontSize: 14.sp)),
              ],
            ),
          ),
          Gap(12.dp),
          SizedBox(
            height: 68.dp,
            width: 68.dp,
            child: Image.network(
              dish.imageUrl,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.image_not_supported_outlined,
                  size: 56.dp,
                  color: Colors.grey,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}