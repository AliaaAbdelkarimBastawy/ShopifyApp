import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSelectSizeWidget extends StatelessWidget {
  String sizeTxt;
  bool isSelected;
   CustomSelectSizeWidget({
    super.key,
     required this.sizeTxt,
     required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 80,
          child: Card(
            elevation: 5,
            child: Center(child: Text(sizeTxt,
              style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 16,
                  color: isSelected? Colors.redAccent : Colors.black54 ),)),
          ),
        )
    );
  }
}
