import 'package:apex_mobile_test/bloc/login_bloc.dart';
import 'package:apex_mobile_test/navigation/app_routes.dart';
import 'package:apex_mobile_test/screens/dashboard_screen.dart';
import 'package:apex_mobile_test/utils/apex_colors.dart';
import 'package:apex_mobile_test/utils/apex_button.dart';
import 'package:apex_mobile_test/utils/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginBloc = LoginBloc();

  // text field controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: apexWhite1,
          leading: const BackButtonWidget(),
        ),
        backgroundColor: apexWhite1,
        body: Container(
          height: double.maxFinite,
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hi There!👋',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: apexBlack),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome back, Sign in to your account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: apexGrey2,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: apexGrey3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: apexWhite2,
                  ),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: apexBlack),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: apexGrey3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: apexWhite2,
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              'assets/images/password_icon.svg'))),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: apexBlack),
                ),
                const SizedBox(height: 24),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: apexGreen2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 40, right: 10, left: 10),
                  child: SizedBox(
                      width: double.maxFinite,
                      child: ApexButtonWidget(
                        text: 'Sign In',
                        onPressed: () {
                          String email = emailController.text;
                          String password = passwordController.text;

                          // making sure parameters are valid before network call
                          if (email.isNotEmpty &&
                              password.isNotEmpty &&
                              isValidEmail(email)) {
                            loginBloc.login(email, password);

                            // listening and reacting to data from BLoC
                            loginBloc.subject.stream.listen((data) {
                              if (data.data != null) {

                                // navigate to Dashboard, delete back stack and pass arguments to Dashboard
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DashboardScreen(),
                                        settings: RouteSettings(
                                            arguments: DashboardScreenArguments(data.data?.user?.username, data.data?.token))));
                              } else {
                              }
                            });
                          }
                        },
                        btnColor: apexBlack,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          width: 142,
                          color: apexGrey1,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          'OR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: apexGrey2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          width: 142,
                          color: apexGrey1,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: apexWhite1,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(color: apexGrey1)),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/google_icon.svg',
                            height: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: apexWhite1,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(color: apexGrey1)),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/apple_icon.svg',
                            height: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 14,
                        color: apexGrey2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUpRoute);
                      },
                      child: const Text(
                        ' Sign Up',
                        style: TextStyle(
                          fontSize: 14,
                          color: apexGreen2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

// check if email is valid
bool isValidEmail(String input) {
  RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,20}$');
  return regex.hasMatch(input);
}

// object for arguments to be passed
class DashboardScreenArguments {
  final String? username;
  final String ?secret;

  DashboardScreenArguments(this.username, this.secret);
}
