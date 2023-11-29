import 'package:flutter/material.dart';

class CustomisedTxtFormField extends StatelessWidget {
  final String labelTxt;
  final TextEditingController txtEditingController;
  final IconData prefixIcon;
  final TextInputType txtInputType;
  const CustomisedTxtFormField({Key? key, required this.labelTxt,
    required this.txtEditingController, required this.prefixIcon, required this.txtInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: txtEditingController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.black,),
        labelText: labelTxt,
        prefixIcon: Icon(prefixIcon,
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

    );
  }
}
