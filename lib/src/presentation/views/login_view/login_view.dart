import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_picker/gen/fonts.gen.dart';
import 'package:food_picker/src/core/router/app_router.dart';
import 'package:food_picker/src/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_picker/src/presentation/core/status/status.dart';
import 'package:food_picker/src/presentation/core/utils/bottom_sheet_extension.dart';
import 'package:food_picker/src/presentation/core/utils/the_toast.dart';
import 'package:food_picker/src/presentation/core/widgets/primary_button.dart';
import 'package:food_picker/src/presentation/core/widgets/primary_icon_button.dart';
import 'package:food_picker/src/presentation/views/login_view/widgets/phone_number_sheet.dart';
import 'package:food_picker/src/presentation/views/login_view/widgets/phone_verification_sheet.dart';
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
            BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state.googleLoginStatus is StatusSuccess) {
                context.router.pushAndPopUntil(HomeRoute(), predicate: (route) => false);
              } else if (state.googleLoginStatus is StatusFailure) {
                TheMessage.show(message: state.googleLoginStatus.errorMessage, context: context);
              }
            }, builder: (context, state) {
              return PrimaryIconButton(
                isLoading: state.googleLoginStatus is StatusLoading,
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
                  context.read<AuthBloc>().add(AuthEvent.googleLogin());
                  // context.router.push(HomeRoute());
                },
              );
            }),
            Gap(8.dp),
            MultiBlocListener(
              listeners: [
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.phoneSendOtpStatus is StatusSuccess) {
                      PhoneVerifySheet(
                        onSubmit: (otp) {
                          context.read<AuthBloc>().add(AuthEvent.phoneVerifyOtp(verificationId: state.verificationId, otp: otp));
                        },
                      ).showAsModalBottomSheet(context);
                    } else if (state.phoneSendOtpStatus is StatusFailure) {
                      TheMessage.show(message: state.phoneSendOtpStatus.errorMessage, context: context);
                    }
                  },
                  listenWhen: (previous, current) => previous.phoneSendOtpStatus != current.phoneSendOtpStatus,
                ),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.phoneVerifyOtpStatus is StatusSuccess) {
                      context.router.pushAndPopUntil(HomeRoute(), predicate: (route) => false);
                    } else if (state.phoneVerifyOtpStatus is StatusFailure) {
                      TheMessage.show(message: state.phoneVerifyOtpStatus.errorMessage, context: context);
                    }
                  },
                  listenWhen: (previous, current) => previous.phoneVerifyOtpStatus != current.phoneVerifyOtpStatus,
                )
              ],
              child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                return PrimaryIconButton(
                  isLoading: state.phoneSendOtpStatus is StatusLoading,
                  backgroundColor: Colors.green,
                  label: "Phone",
                  icon: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  onTap: () {
                    PhoneNumberSheet(
                      onSubmit: (phone) {
                        context.router.popForced();
                        context.read<AuthBloc>().add(AuthEvent.phoneSendOtp(phone));
                      },
                    ).showAsModalBottomSheet(context);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}



