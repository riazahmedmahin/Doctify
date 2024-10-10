import 'package:app/components/Firebase/firebase_service.dart';
import 'package:app/components/Screen/home_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  TextEditingController _PhoneController = TextEditingController();

  @override
  void dispose() {
    _EmailController.dispose();
    _PasswordController.dispose();
    _PhoneController.dispose();
    // TODO: implement dispose
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
                    controller: _PasswordController,
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
    String phone = _PhoneController.text;
    String email =_EmailController.text.trim();
    String password = _PasswordController.text.trim();

    User? user =await _auth.signupWithEmailAndPassword(email, password);
    if(user!= null){
      print("user successfully created");
      Get.to(HomePages());
    }
    else{
      print("something is error");
    }

  }

}
