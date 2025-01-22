import 'package:flutter/material.dart';
import 'package:food_picker/src/presentation/core/utils/the_toast.dart';
import 'package:food_picker/src/presentation/core/widgets/primary_button.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

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