import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RegisterUserService
{
  static Future<void> RegisterUser(TextEditingController emailController,
      TextEditingController passwordController) async {
    //This code is used to create User account on Firebase
    var auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text);
  }


}