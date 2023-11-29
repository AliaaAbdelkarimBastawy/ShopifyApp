import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginView.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelStyle: const TextStyle(color: Colors.black,),
                labelText: "Username",
                prefixIcon: const Icon(Icons.person_2_outlined, color: Colors.black,),
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
                child: const Text("Sign Up",
                  style: TextStyle(color: Colors.white,),),
              ),
            ),
            const SizedBox(height: 16,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text("Already have an account?", style: TextStyle(fontSize: 16),),
                const SizedBox(width: 4,),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Terms of Services", style: TextStyle(fontSize: 12,
                    fontWeight: FontWeight.bold, color:Color(0XFFFF6A6A) ),),
                SizedBox(width: 4,),
                Text("and", style: TextStyle(fontSize: 12,),),
                SizedBox(width: 4,),
                Text("Privacy Policy", style: TextStyle(fontSize: 12,
                    fontWeight: FontWeight.bold, color:Color(0XFFFF6A6A) ),),

              ],),
          ],
        ),
      ),
    );
  }
}
