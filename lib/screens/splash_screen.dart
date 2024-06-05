import 'package:apex_mobile_test/navigation/app_routes.dart';
import 'package:apex_mobile_test/utils/apex_colors.dart';
import 'package:apex_mobile_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences prefs;

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initSharedPreferences();

    // splash screen timer
    Future.delayed(const Duration(seconds: 3), () {

      // determine next screen based on the value of hasSeenOnboarding from shared preferences
      final bool hasSeenOnboarding =
          prefs.getBool(Constants.hasSeenOnboarding) ?? false;
      if (!hasSeenOnboarding) {
        Navigator.pushReplacementNamed(context, AppRoutes.onboardingRoute);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: apexWhite1,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/smartpay_logo.svg'),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Smart',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: apexBlack,
                  ),
                ),
                Text(
                  'pay.',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: apexGreen2,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
