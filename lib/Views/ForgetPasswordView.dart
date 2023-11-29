import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

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
              child: Text("Enter your Email", style:
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
                child: const Text("Reset Password",
                  style: TextStyle(color: Colors.white,),),
              ),
            ),
            const SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
