import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/Views/ForgetPasswordView.dart';
import 'package:shopify_app/Views/SignUpView.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelStyle: const TextStyle(color: Colors.black,),
                labelText: "Email",
                prefixIcon: const Icon(Icons.email_outlined, color: Colors.black,),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFD2D4D6)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFD2D4D6)),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == "") {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
            const SizedBox(height: 16,),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelStyle: const TextStyle(color: Colors.black,),
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock_outline_rounded,
                  color: Colors.black,),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFD2D4D6)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFD2D4D6)),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == "") {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
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
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(onPressed: ()  async{

              },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  elevation: 10,
                  primary: const Color(0XFFFF6A6A), // Background color
                ),
                child: const Text("Login",
                  style: TextStyle(color: Colors.white,),),
              ),
            ),
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
