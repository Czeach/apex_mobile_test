import 'package:apex_mobile_test/navigation/app_routes.dart';
import 'package:apex_mobile_test/utils/apex_colors.dart';
import 'package:apex_mobile_test/utils/apex_button.dart';
import 'package:apex_mobile_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


// class holding onboarding parameters
class OnboardingItem {
  final String device;
  final String illustration;
  final String title;
  final String description;

  OnboardingItem({
    required this.device,
    required this.illustration,
    required this.title,
    required this.description,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late SharedPreferences prefs;
  final PageController pageController = PageController();
  int currentPage = 0;

  // create shared preferences
  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    // initialize shared preferences
    initSharedPreferences();
  }

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      device: "assets/images/device_onboard_1.png",
      illustration: "assets/images/illustration_onboard_1.png",
      title: "Finance app the safest and most trusted",
      description:
          "Your finance work starts here. Our here to help you track and deal with speeding up your transactions.",
    ),
    OnboardingItem(
      device: "assets/images/device_onboard_2.png",
      illustration: "assets/images/illustration_onboard_2.png",
      title: "The fastest transaction process only here",
      description:
          "Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.",
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apexWhite1,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 70),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () async {

                    // navigate to Login screen nand delete back stack
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.loginRoute);

                        // get shared preference value
                    final bool hasSeenOnboarding =
                        prefs.getBool(Constants.hasSeenOnboarding) ?? false;
                    if (!hasSeenOnboarding) {

                      // update shared prefrence
                      prefs.setBool(Constants.hasSeenOnboarding, true);
                    }
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: apexGreen1),
                  ),
                ),
              ),
            ),
            Expanded(
                child: PageView(
              controller: pageController,
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: onboardingItems.map((OnboardingItem item) {
                return OnboardingCard(
                  device: item.device,
                  illustration: item.illustration,
                  title: item.title,
                  description: item.description,
                );
              }).toList(),
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: SmoothPageIndicator(
                controller: pageController,
                count: onboardingItems.length,
                effect: const ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: apexBlack,
                    dotColor: apexGrey1,
                    expansionFactor: 4.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40, right: 40, left: 40),
              child: SizedBox(
                  width: double.maxFinite,
                  child: ApexButtonWidget(
                    text: 'Get Started',
                    onPressed: () async {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.loginRoute);
                      final bool hasSeenOnboarding =
                          prefs.getBool(Constants.hasSeenOnboarding) ?? false;
                      if (!hasSeenOnboarding) {
                        prefs.setBool(Constants.hasSeenOnboarding, true);
                      }
                    },
                    btnColor: apexBlack,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

// widget for onboarding carousel
class OnboardingCard extends StatelessWidget {
  final String title;
  final String description;
  final String device;
  final String illustration;

  const OnboardingCard(
      {super.key,
      required this.title,
      required this.description,
      required this.device,
      required this.illustration});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(device),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Image.asset(
                illustration,
              ),
            ),
            Container(
              width: 287,
              color: apexWhite1,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 20),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: apexBlack),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 287,
                color: apexWhite1,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: apexGrey2),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
