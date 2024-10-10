import 'package:app/components/Screen/authscreen/forgetpass_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  final PageController pageController;

   SignUpForm({Key? key, required this.pageController, required void Function() onCreateAccount}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _EmailController = TextEditingController();

  TextEditingController _PasswordController = TextEditingController();

  //TextEditingController _EmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign In",
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
                  SizedBox(height: 10,),
                  TextButton(onPressed: (){
                    Get.to(ForgotPasswordScreen());

                  },
                   child: Text("Forget Password?"))
                ],
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade300),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.pageController.animateToPage(2, // Navigate to SignInForm page
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.ease);
                    },
                    child: Text("Sign In",style: TextStyle(color: Color.fromARGB(255, 107, 95, 183)),),
                  ),
                  //SizedBox(height: 20,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
