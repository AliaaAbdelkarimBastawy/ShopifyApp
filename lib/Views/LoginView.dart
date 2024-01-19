import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopify_app/Views/ForgetPasswordView.dart';
import 'package:shopify_app/Views/SignUpView.dart';

import '../components/CustomisedBtn.dart';
import '../components/CustomisedTxtFormField.dart';
import '../helper/show_snack_bar.dart';
import '../services/FirebaseNotifications.dart';
import '../services/LoginUser.dart';
import 'HomeView.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  void initState() {
    super.initState();
    // Call your initialization methods here
    initLocalNotifications();
    initPushNotifications(context);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool isLoading = false;
    GlobalKey<FormState> formKey = GlobalKey();

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF5F6F8),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0, backgroundColor: const Color(0xFFF5F6F8),),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
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
                  txtInputType: TextInputType.emailAddress,
                  validator: (data) {
                    if(data!.isEmpty)
                    {
                      return "Email cannot be empty";
                    }
                    else
                    {
                      return null;
                    }
                  },),
                const SizedBox(height: 16,),
                CustomisedTxtFormField(labelTxt: "Password",
                  txtEditingController: passwordController,
                  prefixIcon: Icons.lock_outline_rounded,
                  txtInputType: TextInputType.text,
                  validator: (data) {
                    if(data!.isEmpty)
                    {
                      return "Password cannot be empty";
                    }
                    else
                    {
                      return null;
                    }
                  },),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  TextButton(onPressed: (){
                   Navigator.pushNamed(context, ForgetPasswordView.id);
                  }, child:const Text("Forgot your password?",
                    style: TextStyle(fontSize: 14,
                      color:Color(0XFFFF6A6A) ),),)
                  ],),
                const SizedBox(height: 16,),
                 CustomisedBtn(btnTxt: 'Login', btnColor: const Color(0XFFFF6A6A), txtColor: Colors.white,
                  onPressed: () async{
                    if(formKey.currentState!.validate())
                    {
                      setState(() {
                        isLoading = true;
                      });
                      try
                      {
                        await LoginUserService.LoginUser(emailController, passwordController);
                        Navigator.pushNamed(context, HomeView.id, arguments: emailController.text);
                        // ShowSnackBar(context, "User Logged Successfully", Colors.green);

                      } on FirebaseAuthException catch(ex)
                      {
                        if(ex.code == 'user-not-found') {
                          print("ERRORRR1");
                          ShowSnackBar(context, "No user found for that email", Colors.red);
                        }

                        else if(ex.code == 'wrong-password') {
                          print("ERRORRR2");
                          ShowSnackBar(context,"Wrong password provided for that user", Colors.red);
                        }

                      } catch(ex)
                      {
                        print("ERRORRR3");
                        ShowSnackBar(context,ex.toString(), Colors.red);
                      }


                      setState(() {
                        isLoading = false;
                      });
                    }
                    else
                    {
                    }
                  },),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",
                      style: TextStyle(fontSize: 16),),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, SignUpView.id);
                    }, child:const Text("Sign Up", style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:Color(0XFFFF6A6A) ),),)
                  ],),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
