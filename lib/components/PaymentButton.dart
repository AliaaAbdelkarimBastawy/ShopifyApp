import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  final Color btnColor;
  final String btnTxt;
  final Color txtColor;
  final void Function()? onPressed;

  const PaymentButton({Key? key,
    required this.btnColor,required this.txtColor,
    required this.btnTxt, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          elevation: 10,
          primary: btnColor, // Background color
        ),
        child:  Text(btnTxt,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0
          )
        ),
      ),
    );
  }
}



