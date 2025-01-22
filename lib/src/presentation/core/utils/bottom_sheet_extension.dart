import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

extension BottomSheet on Widget {
  Future showAsModalBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.dp),
          topRight: Radius.circular(24.dp),
        ),
      ),
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: this,
      ),
    );
  }
}
