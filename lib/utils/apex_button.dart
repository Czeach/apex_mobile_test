import 'package:apex_mobile_test/utils/apex_colors.dart';
import 'package:flutter/material.dart';

// button reusable widget
class ApexButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color btnColor;

  const ApexButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(vertical: 22),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: apexWhite1, fontWeight: FontWeight.w700, fontSize: 16),
        ));
  }
}