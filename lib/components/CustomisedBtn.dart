import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomisedBtn extends StatelessWidget {
  final Color btnColor;
  final String btnTxt;
  final Color txtColor;
   void Function()? onPressed;

   CustomisedBtn({Key? key,required this.btnTxt,
    required this.btnColor, required this.txtColor, required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          elevation: 10,
          primary: btnColor, // Background color
        ),
        child:  Text(btnTxt,
          style: TextStyle(color: txtColor,),),
      ),
    );
  }
}
