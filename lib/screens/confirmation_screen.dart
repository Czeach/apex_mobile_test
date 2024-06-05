import 'package:apex_mobile_test/navigation/app_routes.dart';
import 'package:apex_mobile_test/utils/apex_colors.dart';
import 'package:apex_mobile_test/utils/apex_button.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: apexWhite1,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/congrats_img.png'),
              const SizedBox(height: 30),
              const Text(
                'Congratulations, James',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: apexBlack,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "You’ve completed the onboarding, you can start using",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: apexGrey2,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, right: 10, left: 10),
                child: SizedBox(
                    width: double.maxFinite,
                    child: ApexButtonWidget(
                      text: 'Get Started',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
                      },
                      btnColor: apexBlack,
                    )),
              ),
            ],
          ),
        ));
  }
}
