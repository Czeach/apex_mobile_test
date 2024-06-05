import 'package:apex_mobile_test/navigation/app_routes.dart';
import 'package:apex_mobile_test/screens/confirmation_screen.dart';
import 'package:apex_mobile_test/screens/id_screen.dart';
import 'package:apex_mobile_test/screens/login_screen.dart';
import 'package:apex_mobile_test/screens/onboarding_screen.dart';
import 'package:apex_mobile_test/screens/sign_up_screen.dart';
import 'package:apex_mobile_test/screens/verify_screen.dart';
import 'package:flutter/material.dart';

// creating app navigator
class AppNavigator {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboardingRoute:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ScaleTransition(
                scale: animation,
                child: const OnboardingScreen(),
              );
            },
            transitionDuration: const Duration(seconds: 1));
      case AppRoutes.loginRoute:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return ScaleTransition(
                scale: animation,
                child: const LoginScreen(),
              );
        });
      case AppRoutes.signUpRoute:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: const SignUpScreen(),
          );
        });
      case AppRoutes.verifyRoute:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: const VerifyScreen(),
          );
        });
      case AppRoutes.idRoute:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: const IDScreen(),
          );
        });
      case AppRoutes.confirmationRoute:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return ScaleTransition(
                scale: animation,
                child: const ConfirmationScreen(),
              );
        });
      default:
        return null;
    }
  }
}
