import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_picker/src/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_picker/src/presentation/core/status/status.dart';
import 'package:food_picker/src/presentation/core/utils/the_toast.dart';
import 'package:food_picker/src/presentation/core/widgets/primary_button.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

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
