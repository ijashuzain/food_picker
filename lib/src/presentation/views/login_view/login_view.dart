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
                context.router.pushAndPopUntil(HomeRoute(), predicate: (route) => true);
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
                      context.router.pushAndPopUntil(HomeRoute(), predicate: (route) => true);
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

class PhoneNumberSheet extends StatelessWidget {
  PhoneNumberSheet({super.key, required this.onSubmit});

  final Function(String phone) onSubmit;

  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.dp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Phone Number", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp)),
            Gap(24.dp),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                prefixIcon: SizedBox(
                  width: 36.dp,
                  child: Center(
                    child: Text(
                      "+91",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                border: OutlineInputBorder(),
                hintText: "10 digit phone number",
              ),
            ),
            Gap(24.dp),
            PrimaryButton(
              label: "Send OTP",
              onTap: () {
                if (phoneNumberController.text.isNotEmpty) {
                  onSubmit("+91${phoneNumberController.text}");
                } else {
                  TheMessage.show(message: "Please enter phone number", context: context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class PhoneVerifySheet extends StatelessWidget {
  PhoneVerifySheet({super.key, required this.onSubmit});

  final Function(String otp) onSubmit;

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.dp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Verify OTP"),
            TextFormField(
              controller: otpController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "6 Digit OTP",
              ),
            ),
            Gap(24.dp),
            BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              return PrimaryButton(
                isLoading: state.phoneVerifyOtpStatus is StatusLoading,
                label: "Verify",
                onTap: () {
                  if (otpController.text.isNotEmpty) {
                    onSubmit(otpController.text);
                  } else {
                    TheMessage.show(message: "Please enter 6 digit otp", context: context);
                  }
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
