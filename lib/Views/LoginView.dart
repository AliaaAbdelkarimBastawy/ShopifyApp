import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/Views/ForgetPasswordView.dart';
import 'package:shopify_app/Views/SignUpView.dart';

import '../components/CustomisedBtn.dart';
import '../components/CustomisedTxtFormField.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0, backgroundColor: const Color(0xFFF5F6F8),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(child: Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Text("Login", style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 26,),),
            )),
            CustomisedTxtFormField(labelTxt: "Email",
              txtEditingController: emailController,
              prefixIcon: Icons.email_outlined,
              txtInputType: TextInputType.emailAddress,),
            const SizedBox(height: 16,),
            CustomisedTxtFormField(labelTxt: "Password",
              txtEditingController: passwordController,
              prefixIcon: Icons.lock_outline_rounded,
              txtInputType: TextInputType.text,),
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              TextButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder)=> const ForgetPasswordView()));
              }, child:const Text("Forgot your password?", style: TextStyle(fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color:Color(0XFFFF6A6A) ),),)
              ],),
            const SizedBox(height: 16,),
            const CustomisedBtn(btnTxt: 'Login', btnColor: Color(0XFFFF6A6A), txtColor: Colors.white,),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?",
                  style: TextStyle(fontSize: 16),),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (builder)=> const SignUpView()));
                }, child:const Text("Sign Up", style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:Color(0XFFFF6A6A) ),),)
              ],),
          ],
        ),
      ),
    );
  }
}
