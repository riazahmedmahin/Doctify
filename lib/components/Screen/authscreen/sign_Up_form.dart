import 'package:app/components/Firebase/firebase_service.dart';
import 'package:app/components/Screen/MainBottomNavScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  TextEditingController _PhoneController = TextEditingController();

  bool _isLoading = false; // Loading state

  @override
  void dispose() {
    _EmailController.dispose();
    _PasswordController.dispose();
    _PhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create an account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 16),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _EmailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Email address",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.mail,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _PasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _PhoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Phone number",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      child: ElevatedButton(
                        onPressed: _signup,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 65, vertical: 17),
                        ),
                        child: _isLoading
                            ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                            : Text(
                          'Sign In', // Correct the label
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _signup() async {

    setState(() {
      _isLoading=true;
    });

    String phone = _PhoneController.text.trim();
    String email= _EmailController.text.trim();
    String password = _PasswordController.text.trim();
    User? user = await _auth.signupWithEmailAndPassword(email, password);
    setState(() {
      _isLoading=false;
    });
    if(user!=null){
      Get.to(MainBottomNavScreen());
    }
    else{
      print("something is error");
    }
  }
}
