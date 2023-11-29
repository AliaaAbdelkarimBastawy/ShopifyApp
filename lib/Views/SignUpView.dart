import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/CustomisedBtn.dart';
import '../components/CustomisedTxtFormField.dart';
import 'LoginView.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(elevation: 0, backgroundColor: const Color(0xFFF5F6F8),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(child: Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Text("Sign Up", style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 26,),),
            )),
            CustomisedTxtFormField(labelTxt: "Username",
              txtEditingController: usernameController,
              prefixIcon: Icons.person_2_outlined,
              txtInputType: TextInputType.text,),
            const SizedBox(height: 16,),
            CustomisedTxtFormField(labelTxt: "Email",
              txtEditingController: emailController,
              prefixIcon: Icons.email_outlined,
              txtInputType: TextInputType.emailAddress,),
            const SizedBox(height: 16,),
            CustomisedTxtFormField(labelTxt: "Password",
              txtEditingController: passwordController,
              prefixIcon: Icons.lock_outline_rounded,
              txtInputType: TextInputType.text,),
            const SizedBox(height: 16,),
            const CustomisedBtn(btnTxt: 'Sign Up', btnColor: Color(0XFFFF6A6A), txtColor: Colors.white,),
            const SizedBox(height: 16,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text("Already have an account?", style: TextStyle(fontSize: 16),),

              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (builder)=> const LoginView()));
              }, child:const Text("Login", style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:Color(0XFFFF6A6A) ),),)
            ],),
            const SizedBox(height: 24,),
            const Text("By creating an account you agree to our",
              style: TextStyle(fontSize: 12),),
            const SizedBox(height: 2,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: const Text("Terms of Services",
                    style: TextStyle(fontSize: 12,color:Color(0XFFFF6A6A) ),),
                ),
                const SizedBox(width: 4,),
                const Text("and", style: TextStyle(fontSize: 12,),),
                const SizedBox(width: 4,),
                GestureDetector(onTap: (){},
                    child: const Text("Privacy Policy", style: TextStyle(fontSize: 12, color:Color(0XFFFF6A6A) ),)),

              ],),
          ],
        ),
      ),
    );
  }
}
