import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_picker/src/core/di/di.dart';
import 'package:food_picker/src/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_picker/src/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:food_picker/src/presentation/blocs/home_bloc/home_bloc.dart';

List<BlocProvider> kProviders = [
  BlocProvider<AuthBloc>(create: (ctx) => getIt<AuthBloc>()),
  BlocProvider<HomeBloc>(create: (ctx) => getIt<HomeBloc>()),
  BlocProvider<CartBloc>(create: (ctx) => getIt<CartBloc>()),
];
