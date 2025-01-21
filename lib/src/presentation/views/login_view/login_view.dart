import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_picker/gen/fonts.gen.dart';
import 'package:food_picker/src/core/router/app_router.dart';
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
            IconButton(
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
            IconButton(
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

class IconButton extends StatelessWidget {
  const IconButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.isLoading = false,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.black87,
  });

  final String label;
  final Widget icon;
  final VoidCallback onTap;
  final bool isLoading;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isLoading) {
          onTap();
        }
      },
      child: Container(
        height: 56.dp,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(56.dp),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.dp),
          child: Stack(
            children: [
              SizedBox(
                height: 56.dp,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    isLoading ? SizedBox() : icon,
                  ],
                ),
              ),
              SizedBox(
                height: 56.dp,
                width: double.infinity,
                child: Center(
                  child: isLoading
                      ? SizedBox(
                          height: 24.dp,
                          width: 24.dp,
                          child: Padding(
                            padding: EdgeInsets.all(1.dp),
                            child: CircularProgressIndicator(
                              strokeWidth: 2.dp,
                              color: foregroundColor,
                            ),
                          ),
                        )
                      : Text(
                          label,
                          style: TextStyle(
                            fontFamily: FontFamily.gilroy,
                            color: foregroundColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
