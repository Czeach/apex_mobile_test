
import 'package:apex_mobile_test/core/di/di.dart';
import 'package:apex_mobile_test/navigation/app_navigator.dart';
import 'package:apex_mobile_test/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  // initialise di before running app
  init();
  runApp(const App());
}

// Implementing app navigator
Route<dynamic>? onGenerateRouteWrapper(RouteSettings settings) {
  return AppNavigator.onGenerateRoute(settings);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRouteWrapper,
      home: SplashScreen()
    );
  }
}
