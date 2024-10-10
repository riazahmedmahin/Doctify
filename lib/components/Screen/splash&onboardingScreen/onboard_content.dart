// onboard_content.dart
import 'package:app/components/Screen/MainBottomNavScreen.dart';
import 'package:app/components/Screen/authscreen/sign_Up_form.dart';
import 'package:app/components/Screen/authscreen/sing_in_form.dart';
import 'package:app/components/Screen/splash&onboardingScreen/landed_content.dart';
import 'package:flutter/material.dart';


class OnboardContent extends StatefulWidget {
  const OnboardContent({super.key});

  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController()
      ..addListener(() {
        setState(() {});
      });
  }

  void _navigateToMainBottomNavScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainBottomNavScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double progress = _pageController.hasClients ? (_pageController.page ?? 0) : 0;
    final int currentPage = progress.round();

    return SizedBox(
      height: 340 + progress * 160,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    const LandingContent(),
                    SignUpForm(
                      pageController: _pageController,
                      onCreateAccount: _navigateToMainBottomNavScreen,
                    ),
                    const SignInForm(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            height: 56,
            bottom: 48 + progress * 100,
            right: 16,
            child: GestureDetector(
              onTap: () {
                if (currentPage == 0) {
                  _pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.ease);
                } else if (currentPage == 1) {
                  _navigateToMainBottomNavScreen();
                } else if (currentPage == 2) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainBottomNavScreen()),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: [0.4, 0.8],
                    colors: [
                      Color.fromARGB(255, 22, 108, 207),
                      Color.fromARGB(255, 22, 108, 207),
                    ],
                  ),
                ),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 92 + progress * 30,
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            if (currentPage == 0)
                              const Text("Get Started"),
                            if (currentPage == 1)
                              const Text(
                                "Signin",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            if (currentPage == 2)
                              const Text(
                                "Create account",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
