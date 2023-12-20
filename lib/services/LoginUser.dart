import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginUserService
{
  static Future<void> LoginUser(TextEditingController emailController,
      TextEditingController passwordController) async {
    //This code is used to create User account on Firebase
    var auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text);
  }
}