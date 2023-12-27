import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareCustomBtn extends StatelessWidget {
  String btnTxt;
  Color btnColor;
  Color txtColor;
  IconData btnIcon;

   ShareCustomBtn({
    super.key,
     required this.btnTxt, required this.txtColor,
     required this.btnColor, required this.btnIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 160,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 40,
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            offset: const Offset(10, 10),
          )],
      ),
      child: Card(
        color: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 20,
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(btnTxt,
                  style: TextStyle(color:txtColor, fontWeight: FontWeight.bold),),
                const SizedBox(width: 8,),
                CircleAvatar(
                  backgroundColor: txtColor,
                  radius: 16,
                  child: IconButton(
                      onPressed: (){},
                      icon:  Center(child: Icon(btnIcon,
                        color: btnColor, size: 16,))),
                )

              ],                ),
          ),
        ),
      ),
    );
  }
}
