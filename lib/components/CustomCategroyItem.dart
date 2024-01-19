import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCategoryItem extends StatelessWidget {
  String categoryName;
  String categoryImage;
   CustomCategoryItem({
    super.key,
    required this.categoryName,
     required this.categoryImage
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Card(
           color:const Color(0xFFF5F6F8),
           elevation: 8,
           shape: const CircleBorder(
             side: BorderSide(color: Colors.black12)
           ),
           child: Padding(
             padding: const EdgeInsets.all(4.0),
             child: CircleAvatar(
               backgroundColor:const Color(0xFFF5F6F8),

              backgroundImage: NetworkImage(categoryImage,),
              radius: 40,
                     ),
           ),
         ),
        const SizedBox(height: 4,),
        Text(categoryName),
      ],
    );
  }
}
