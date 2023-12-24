import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSelectColorWidget extends StatelessWidget {
  bool isSelected =false;
  Color WhichColor;
   CustomSelectColorWidget({
    super.key,
     required this.isSelected, required this.WhichColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: (
          CircleAvatar(
            radius: 25,
            backgroundColor: WhichColor,
            child: Visibility(
              visible: isSelected? true : false,
              child: const Icon(Icons.done,
                color: Colors.white,size: 25,),
            ),
          )
      ),
    );
  }
}
