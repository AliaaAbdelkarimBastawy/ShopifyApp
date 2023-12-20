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
          backgroundColor: Colors.pink,
          radius: 40,
        ),
        Text(categoryName),
      ],
    );
  }
}
