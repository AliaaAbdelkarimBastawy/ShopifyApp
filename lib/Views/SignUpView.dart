import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopify_app/Views/HomeView.dart';
import '../components/CustomisedBtn.dart';
import '../components/CustomisedTxtFormField.dart';
import '../helper/show_snack_bar.dart';
import '../services/RegisterUser.dart';
import 'LoginView.dart';

class SignUpView extends StatefulWidget {
   SignUpView({Key? key}) : super(key: key);

  static String id = 'SignUpView';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
        appBar: AppBar(elevation: 0, backgroundColor: const Color(0xFFF5F6F8),),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Center(child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text("Sign Up", style:
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
                const SizedBox(height: 16,),
                 CustomisedBtn(btnTxt: 'Sign Up',
                  btnColor: const Color(0XFFFF6A6A),
                  txtColor: Colors.white,
                   onPressed: () async{
                   if(formKey.currentState!.validate())
                     {
                       isLoading = true;
                       setState(() {

                       });
                       try
                       {
                         await RegisterUserService.RegisterUser(emailController, passwordController);
                         Navigator.pushNamed(context, HomeView.id);
                         // ShowSnackBar(context, "User registered Successfully", Colors.green);

                       }
                       on FirebaseAuthException catch(ex)
                       {
                         if(ex.code == 'weak-password') {
                           ShowSnackBar(context, "Weak password", Colors.red);
                         }

                         else if(ex.code == 'email-already-in-use') {
                           ShowSnackBar(context,"Email already exists", Colors.red);
                         }

                       }
                       catch(ex)
                       {
                         ShowSnackBar(context,ex.toString(), Colors.red);
                       }

                       isLoading = false;
                       setState(() {

                       });
                     }
                   else
                   {

                   }
                   },),
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
        ),
      ),
    );
  }


}
