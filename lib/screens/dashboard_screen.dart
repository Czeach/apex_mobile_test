import 'package:apex_mobile_test/screens/login_screen.dart';
import 'package:apex_mobile_test/utils/apex_colors.dart';
import 'package:apex_mobile_test/utils/back_button.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {

    // get argument passed from register screen
    final args =
        ModalRoute.of(context)?.settings.arguments as DashboardScreenArguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: apexWhite1,
          leading: const BackButtonWidget(),
        ),
        backgroundColor: apexWhite1,
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Hi ',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: apexBlack),
                  ),
                  Text(
                    '${args.username}! 👋',
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: apexBlack),
                  ),
                ],
              ),
              const Text(
                'Welcome to apex! Below is your secret, have fun cracking the code',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: apexGrey2,
                ),
              ),
              Flexible(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      '${args.secret}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: apexBlack,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
