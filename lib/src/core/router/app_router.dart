import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_picker/src/presentation/views/home_view/home_view.dart';
import 'package:food_picker/src/presentation/views/login_view/login_view.dart';
import 'package:food_picker/src/presentation/views/splash_view/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Page|Screen,Route')
class AppRouter extends RootStackRouter {
  static final AppRouter _instance = AppRouter._internal();
  factory AppRouter() => _instance;
  AppRouter._internal();

  final router = const AutoRouter();

  static AppRouter get instance => _instance;

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: SplashRoute.page,initial: true),
      AutoRoute(page: HomeRoute.page),
      AutoRoute(page: LoginRoute.page),
    ];
  }
}
