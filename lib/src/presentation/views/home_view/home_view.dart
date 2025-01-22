import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_picker/src/core/router/app_router.dart';
import 'package:food_picker/src/domain/models/menu_model/menu_model.dart';
import 'package:food_picker/src/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_picker/src/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:food_picker/src/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:food_picker/src/presentation/core/status/status.dart';
import 'package:food_picker/src/presentation/core/utils/the_toast.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeEvent.fetchMenu());
    context.read<CartBloc>().add(CartEvent.getCart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return DefaultTabController(
        length: state.menu.categories.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: Drawer(
            backgroundColor: Colors.white,
            width: 90.w,
            child: Column(
              children: [
                Container(
                  height: 28.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.dp),
                      bottomRight: Radius.circular(20.dp),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.greenAccent,
                        Colors.green,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state.logoutStatus is StatusSuccess) {
                        context.read<CartBloc>().add(CartEvent.clearCart());
                        context.router.pushAndPopUntil(LoginRoute(), predicate: (route) => true);
                      } else if (state.logoutStatus is StatusFailure) {
                        TheMessage.show(message: state.logoutStatus.errorMessage, context: context);
                      }
                    },
                    listenWhen: (previous, current) => previous.logoutStatus != current.logoutStatus,
                    builder: (context, state) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Spacer(),
                          CircleAvatar(
                            radius: 36.dp,
                            backgroundImage: state.user != null && state.user?.photoURL != null ? NetworkImage(state.user?.photoURL ?? "") : null,
                          ),
                          Gap(16.dp),
                          Text(
                            state.user != null ? state.user?.displayName ?? state.user?.phoneNumber ?? "" : "",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "ID : ${state.user?.uid}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black87,
                            ),
                          ),
                          const Spacer(),
                        ],
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.black54,
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          context.read<AuthBloc>().add(AuthEvent.logout());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {
                  context.router.push(const CartRoute());
                },
                icon: BlocBuilder<CartBloc,CartState>(
                  builder: (context,state){
                    return Badge(
                      label: Text(state.cartItems.length.toString()),
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                      ),
                    );
                  }
                ),
              ),
            ],
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.redAccent,
              labelColor: Colors.redAccent,
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              tabs: state.menu.categories
                  .map((e) => Tab(
                        text: e.name,
                      ))
                  .toList(),
            ),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.fetchMenuStatus is StatusLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return TabBarView(
                  children: state.menu.categories
                      .map((category) => CategoryWidget(
                            category: category,
                          ))
                      .toList(),
                );
              }
            },
          ),
        ),
      );
    });
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemBuilder: (context, index) {
        return DishWidget(
          dish: category.dishes[index],
        );
      },
      itemCount: category.dishes.length,
    );
  }
}

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
