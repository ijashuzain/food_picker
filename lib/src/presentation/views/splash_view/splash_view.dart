import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_picker/src/core/router/app_router.dart';
import 'package:food_picker/src/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_picker/src/presentation/core/status/status.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((val) async {
      context.lockToPortrait();
      await Future.delayed(const Duration(seconds: 2));
      context.read<AuthBloc>().add(AuthEvent.checkAuth());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc,AuthState>(
        listener: (context,state){
          if(state.checkAuthStatus is StatusSuccess){
            context.router.replace(const HomeRoute());
          }else if(state.checkAuthStatus is StatusFailure){
            context.router.replace(const LoginRoute());
          }
        },
        listenWhen: (previous,current) => previous.checkAuthStatus != current.checkAuthStatus,
        builder: (context,state) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}
