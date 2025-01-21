import 'package:flutter/material.dart';
import 'package:food_picker/gen/fonts.gen.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isLoading = false,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.black87,
  });

  final String label;
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
