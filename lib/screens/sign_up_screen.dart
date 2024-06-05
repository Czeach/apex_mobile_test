import 'package:apex_mobile_test/bloc/get_token_bloc.dart';
import 'package:apex_mobile_test/navigation/app_routes.dart';
import 'package:apex_mobile_test/screens/verify_screen.dart';
import 'package:apex_mobile_test/utils/apex_colors.dart';
import 'package:apex_mobile_test/utils/apex_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/back_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final getTokenBloc = GetTokenBloc();
  final emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: apexWhite1,
        leading: const BackButtonWidget(),
      ),
      backgroundColor: apexWhite1,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Create a ',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: apexBlack),
                      ),
                      Text(
                        'Smartpay',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: apexGreen2),
                      )
                    ],
                  ),
                  const Text(
                    'account',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: apexBlack),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: emailTextController,
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
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 40, right: 10, left: 10),
                    child: SizedBox(
                        width: double.maxFinite,
                        child: ApexButtonWidget(
                          text: 'Sign Up',
                          onPressed: () {
                            String email = emailTextController.text;
                            if (isValidEmail(email)) {
                              getTokenBloc.getToken(email);
                              getTokenBloc.subject.stream.listen((data) {
                                if (data.data != null) {
                                  String token = data.data!.token.toString();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const VerifyScreen(),
                                          settings: RouteSettings(
                                              arguments: VerifyScreenArguments(
                                                  token, email))));
                                }
                              });
                            } else {}
                          },
                          btnColor: apexBlack,
                        )),
                  ),
                  const SizedBox(height: 12),
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
                              color: apexGrey1,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            width: 142,
                            color: apexGrey1,
                          ),
                        ),
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
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 14,
                    color: apexGrey2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.loginRoute);
                  },
                  child: const Text(
                    ' Sign In',
                    style: TextStyle(
                      fontSize: 14,
                      color: apexGreen2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

bool isValidEmail(String input) {
  RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,20}$');
  return regex.hasMatch(input);
}

class VerifyScreenArguments {
  final String token;
  final String email;

  VerifyScreenArguments(this.token, this.email);
}
