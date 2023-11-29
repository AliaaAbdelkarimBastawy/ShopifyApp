import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/CustomisedBtn.dart';
import '../components/CustomisedTxtFormField.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
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
            CustomisedTxtFormField(labelTxt: "Email",
              txtEditingController: emailController,
              prefixIcon: Icons.email_outlined,
              txtInputType: TextInputType.emailAddress,),
            const SizedBox(height: 16,),
            const CustomisedBtn(btnTxt: 'Reset Password', btnColor: Color(0XFFFF6A6A), txtColor: Colors.white,),
            const SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
