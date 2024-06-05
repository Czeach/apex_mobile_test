import 'package:apex_mobile_test/bloc/verify_token_bloc.dart';
import 'package:apex_mobile_test/screens/id_screen.dart';
import 'package:apex_mobile_test/screens/sign_up_screen.dart';
import 'package:apex_mobile_test/utils/apex_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../utils/apex_colors.dart';
import '../utils/back_button.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final verifyTokenBloc = VerifyTokenBloc();
  late TextEditingController pinCodeController;
  int pinLength = 5;

  // hide email
  String maskEmail(String email) {
    final List<String> emailParts = email.split('@');
    final String localPart = emailParts[0];
    final String domainPart = emailParts[1];

    final String maskedLocalPart = localPart.length <= 4
        ? '${localPart.substring(0, 1)}***${localPart.substring(localPart.length)}'
        : '${localPart.substring(0, 2)}***${localPart.substring(localPart.length)}';
    return '$maskedLocalPart@$domainPart';
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as VerifyScreenArguments;
    pinCodeController =
        TextEditingController.fromValue(TextEditingValue(text: args.token));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: apexWhite1,
          leading: const BackButtonWidget(),
        ),
        backgroundColor: apexWhite1,
        body: Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Verify it's you",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: apexBlack),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'We send a code to ( ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: apexGrey2,
                      ),
                    ),
                    Text(
                      maskEmail(args.email),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: apexGrey2,
                      ),
                    ),
                    const Text(
                      ' ). Enter it ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: apexGrey2,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'here to verify your identity',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: apexGrey2,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Align(
                  alignment: Alignment.center,
                  child: PinCodeTextField(
                    controller: pinCodeController,
                    maxLength: pinLength,
                    keyboardType: TextInputType.number,
                    pinBoxBorderWidth: 0,
                    defaultBorderColor: apexGreen1,
                    hasTextBorderColor: apexWhite1,
                    pinBoxRadius: 16,
                    pinBoxColor: apexWhite1,
                    pinTextStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: apexBlack),
                    wrapAlignment: WrapAlignment.spaceBetween,
                  ),
                ),
                const SizedBox(height: 40),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Resend Code 30 secs',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: apexGrey4,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 40, right: 10, left: 10),
                  child: SizedBox(
                      width: double.maxFinite,
                      child: ApexButtonWidget(
                        text: 'Confirm',
                        onPressed: () {
                          verifyTokenBloc.verifyToken(args.email, args.token);
                          verifyTokenBloc.subject.stream.listen((data) {
                            if (data.data != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const IDScreen(),
                                      settings: RouteSettings(
                                          arguments: args.email)));
                            }
                          });
                        },
                        btnColor: apexBlack,
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
