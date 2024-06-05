import 'package:apex_mobile_test/bloc/register_bloc.dart';
import 'package:apex_mobile_test/navigation/app_routes.dart';
import 'package:apex_mobile_test/utils/apex_colors.dart';
import 'package:apex_mobile_test/utils/apex_button.dart';
import 'package:apex_mobile_test/utils/back_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IDScreen extends StatefulWidget {
  const IDScreen({super.key});

  @override
  State<IDScreen> createState() => _IDScreenState();
}

class _IDScreenState extends State<IDScreen> {
  final registerBloc = RegisterBloc();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Country? selectedCountry;
  String passwordError = '';

  @override
  Widget build(BuildContext context) {

    // retrieve data passed from verify screen
    final email = ModalRoute.of(context)?.settings.arguments;
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
                  'Hey There! tell us a bit',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: apexBlack),
                ),
                const Row(
                  children: [
                    Text(
                      'about ',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: apexBlack),
                    ),
                    Text(
                      'yourself',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: apexGreen2),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: fullnameController,
                  decoration: InputDecoration(
                    hintText: 'Full name',
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
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: apexBlack),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
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
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: apexBlack),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: countryController,
                  decoration: InputDecoration(
                      hintText: 'Select Country',
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
                      prefixIcon: selectedCountry != null
                          ? Center(
                              widthFactor: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 10),
                                child: Text(
                                  selectedCountry!.flagEmoji,
                                  style: const TextStyle(fontSize: 32),
                                ),
                              ))
                          : null,
                      suffixIcon: IconButton(
                          onPressed: () {
                            showCountryPicker(
                                context: context,
                                countryListTheme: const CountryListThemeData(
                                    searchTextStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: apexBlack),
                                    inputDecoration: InputDecoration(
                                        hintText: 'Search',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: apexGrey2),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          size: 24,
                                        ),
                                        suffixIcon: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: apexBlack),
                                        ))),
                                onSelect: (Country country) {
                                  setState(() {
                                    selectedCountry = country;
                                    countryController.text = country.name;
                                  });
                                });
                          },
                          icon: SvgPicture.asset(
                              'assets/images/arrow_down_icon.svg'))),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: apexBlack),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  onChanged: (value) {
                    if (validatePassword(value)) {
                      setState(() {
                        passwordError = '';
                      });
                    } else {
                      setState(() {});
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Password',
                      errorText: passwordError,
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
                const SizedBox(height: 30),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 40, right: 10, left: 10),
                  child: SizedBox(
                      width: double.maxFinite,
                      child: ApexButtonWidget(
                        text: 'Continue',
                        onPressed: () {
                          if (validatePassword(passwordController.text)) {

                            // provide parameters for network call
                            registerBloc.register(
                                fullnameController.text,
                                usernameController.text,
                                email.toString(),
                                selectedCountry!.countryCode.toString(),
                                passwordController.text);

                                // listening and reacting to data from BLoC
                            registerBloc.subject.stream.listen((data) {
                              if (data.data != null) {
                                // navigate to confirmation on networkcall success and delete back stack
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.confirmationRoute);
                              }
                            });
                          }
                        },
                        btnColor: apexBlack,
                      )),
                ),
              ],
            ),
          ),
        ));
  }

  // make sure password is valid
  bool validatePassword(String password) {
    if (password.length < 8) {
      passwordError = 'Password must be at least 8 characters long';
      return false;
    }
    if (!password.contains(RegExp(r"[a-z]"))) {
      passwordError = 'Password must contain at least one lowercase letter';
      return false;
    }
    if (!password.contains(RegExp(r"[A-Z]"))) {
      passwordError = 'Password must contain at least one uppercase letter';
      return false;
    }
    if (!password.contains(RegExp(r"[0-9]"))) {
      passwordError = 'Password must contain at least one digit';
      return false;
    }

    String specialCharacters = "!@#\$%^&*(),.?\":{}|<>~_-";
    bool hasSpecialCharacter = false;

    for (var char in specialCharacters.split("")) {
      if (password.contains(char)) {
        hasSpecialCharacter = true;
        break;
      }
    }

    if (!hasSpecialCharacter) {
      password = 'Password must contain at least one special character';
      return false;
    }
    passwordError = '';
    return true;
  }
}
