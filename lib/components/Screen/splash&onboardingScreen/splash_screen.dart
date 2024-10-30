import 'package:app/components/Screen/splash&onboardingScreen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offAll(OnboardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 108, 207), // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Row to separate the 'D' and the rest of the text 'octify'
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Yellow circle around 'D'
                CircleAvatar(
                  radius: 22, // Adjust the circle size as needed
                  backgroundColor: Colors.yellow, // Yellow background
                  child: Text(
                    "D",
                    style: TextStyle(
                      fontSize: 30, // Adjust font size as needed
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                //const SizedBox(width: 8), // Space between 'D' and 'octify'
                // Rest of the text 'octify'
                Text(
                  "octify",
                  style: TextStyle(
                    fontSize: 30, // Matching font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
