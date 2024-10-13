import 'package:app/wigets/tostmessage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to sign up with email and password
  Future<User?> signupWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if(e.code == 'email-already-in-use'){
        showToast(message: "The Email is already use");
      }
      else{
        showToast(message: " ${e.code}");
      }

      return null;
    }
  }

  // Method to sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if(e.code== 'user-not-found'||e.code=='wrong-password')
      {
        showToast(message: "Invalid emil address");
      }
      else{
        print("an error occured: ${e.code}");
      }
      return null;
    }
  }
}
