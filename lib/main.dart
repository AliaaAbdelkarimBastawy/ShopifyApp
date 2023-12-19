import 'package:flutter/material.dart';
import 'package:shopify_app/Views/LoginView.dart';
import 'package:shopify_app/Views/SignUpView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MaterialApp(
    routes: {
      LoginView.id : (Context) => const LoginView(),
      SignUpView.id : (Context) => const SignUpView(),
    },
    debugShowCheckedModeBanner: false,
    initialRoute: LoginView.id,
  ));
}

