import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/models/Product.dart';

class CustomGridProductsItem extends StatelessWidget {
  Product model;
   CustomGridProductsItem({
    super.key,
     required this.model
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))
      ),
      color: Colors.white,
      elevation: 8,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: Colors.white,

        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.network(model.image, width: 100, height: 100,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4,),
                Text(model.name, maxLines: 1,),
                const SizedBox(height: 2,),
                Text(r"$"'${model.price}',
                  style: const TextStyle(fontWeight: FontWeight.bold),),
              ],),
          ),
        ],),
      ),
    );
  }
}
