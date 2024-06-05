import 'package:apex_mobile_test/utils/apex_colors.dart';
import 'package:apex_mobile_test/utils/apex_button.dart';
import 'package:apex_mobile_test/utils/back_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  int pinLength = 5;

  @override
  Widget build(BuildContext context) {
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
                  'Set your PIN code',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: apexBlack),
                ),
                const SizedBox(height: 10),
                const Text(
                  'We use state-of-the-art security measures to protect your information at all times',
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
                    appContext: context,
                    length: pinLength,
                    keyboardType: TextInputType.number,
                    cursorColor: apexGreen1,
                    obscureText: true,
                    animationType: AnimationType.none,
                    pinTheme: PinTheme(
                      fieldWidth: 56,
                      shape: PinCodeFieldShape.underline,
                      borderWidth: 0,
                      activeColor: apexGreen2,
                      selectedColor: apexGreen2,
                      inactiveColor: apexGreen2,
                    ),
                    textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: apexBlack
                      ),
                  ),
                ),
                const SizedBox(height: 80),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 40, right: 10, left: 10),
                  child: SizedBox(
                      width: double.maxFinite,
                      child: ApexButtonWidget(
                        text: 'Create PIN',
                        onPressed: () {},
                        btnColor: apexBlack,
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}