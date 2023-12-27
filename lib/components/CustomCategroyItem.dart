import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCategoryItem extends StatelessWidget {
  String categoryName;
   CustomCategoryItem({
    super.key,
    required this.categoryName
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xFFEDDCFF),
          backgroundImage: AssetImage("assets/images/dresses.png"),
          radius: 40,
        ),
        SizedBox(height: 4,),
        Text(categoryName),
      ],
    );
  }
}
