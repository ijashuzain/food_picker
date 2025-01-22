import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_picker/src/domain/models/cart_item_model/cart_item_model.dart';
import 'package:food_picker/src/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:food_picker/src/presentation/core/widgets/primary_button.dart';
import 'package:food_picker/src/presentation/views/cart_view/widgets/order_dish_widget.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

@RoutePage()
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Order Summary",
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.dp),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 100.h - 202.dp,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.dp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      children: [
                        Container(
                          height: 56.dp,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.dp),
                              topRight: Radius.circular(10.dp),
                            ),
                          ),
                          child: Center(
                            child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                              var dishes = state.cartItems.length;
                              var items = state.cartItems.fold(0, (previousValue, element) => previousValue + element.quantity);
                              return Text(
                                "$dishes Dishes - $items Items",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                          ),
                        ),
                        Flexible(
                          child: BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              if (state.cartItems.isEmpty) {
                                return Center(
                                  child: Text(
                                    "Your cart is empty",
                                    style: TextStyle(),
                                  ),
                                );
                              }
                              return ListView.separated(
                                separatorBuilder: (context, index) => Divider(),
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) => OrderedDishWidget(
                                  cartItem: state.cartItems[index],
                                ),
                                itemCount: state.cartItems.length,
                              );
                            },
                          ),
                        ),
                        // Footer Section
                        Container(
                          height: 68.dp,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.dp),
                              bottomRight: Radius.circular(10.dp),
                            ),
                          ),
                          child: Column(
                            children: [
                              Divider(
                                thickness: 1.5.dp,
                                color: Colors.grey,
                              ),
                              Gap(12.dp),
                              Row(
                                children: [
                                  Gap(16.dp),
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                                    var totalPrice = state.cartItems.fold<double>(0, (previousValue, element) => previousValue + (double.parse(element.dish.price) * element.quantity));
                                    return Text(
                                      "INR. ${totalPrice.toStringAsFixed(2)}",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }),
                                  Gap(16.dp),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Spacer(),
            PrimaryButton(
              backgroundColor: Colors.green,
              label: "Place Order",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    title: Text("Order Summary"),
                    content: Text("Order placed successfully"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.read<CartBloc>().add(CartEvent.clearCart());
                          context.router.popForced();
                          context.router.popForced();
                        },
                        child: Text(
                          "OK",
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Gap(16.dp),
          ],
        ),
      ),
    );
  }
}
