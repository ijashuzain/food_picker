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
import 'package:food_picker/src/presentation/views/home_view/widgets/category_widget.dart';
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
          drawer: _buildDrawer(context),
          appBar: _buildAppBar(context, state),
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

  AppBar _buildAppBar(BuildContext context, HomeState state) {
    return AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                context.router.push(const CartRoute());
              },
              icon: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                return Badge(
                  label: Text(state.cartItems.length.toString()),
                  child: const Icon(
                    Icons.shopping_cart_rounded,
                  ),
                );
              }),
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
        );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
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
                      context.router.pushAndPopUntil(SplashRoute(), predicate: (route) => false);
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
        );
  }
}
