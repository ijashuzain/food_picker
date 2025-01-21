import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_picker/gen/fonts.gen.dart';
import 'package:food_picker/src/core/router/app_router.dart';
import 'package:food_picker/src/presentation/core/widgets/primary_icon_button.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.dp),
        child: Column(
          children: [
            Spacer(),
            Text(
              "🥗",
              style: TextStyle(
                fontFamily: FontFamily.gilroy,
                color: Colors.black,
                fontSize: 56.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Food Picker",
              style: TextStyle(
                fontFamily: FontFamily.gilroy,
                color: Colors.black,
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Sign in to continue",
              style: TextStyle(
                fontFamily: FontFamily.gilroy,
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            PrimaryIconButton(
              backgroundColor: Colors.blue,
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 12.dp,
                child: Padding(
                  padding: EdgeInsets.all(3.dp),
                  child: Image.asset("assets/images/google.png"),
                ),
              ),
              label: "Google",
              onTap: () {
                context.router.push(HomeRoute());
              },
            ),
            Gap(8.dp),
            PrimaryIconButton(
              backgroundColor: Colors.green,
              label: "Phone",
              icon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
