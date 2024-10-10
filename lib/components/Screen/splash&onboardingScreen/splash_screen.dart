import 'package:app/onboarding_screen.dart';
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
    await Future.delayed(const Duration(seconds: 1),);
    Get.offAll(OnboardingScreen());

  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 108, 207),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            //Image.asset("assets/applogo.png"),
            Text("Doctify",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color: Colors.white),),
            Spacer(),
            //CircularProgressIndicator(),
            SizedBox(height: 16),
            
          ],
        ),
      ),
    );
  }
}