import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/models/Product.dart';

class CustomProductsItem extends StatelessWidget {
  Product model;
   CustomProductsItem({
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
      elevation: 4,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            color: Colors.white,
            border: Border.all(
              width: 8,
              color: Colors.white,
            ),
          ),
        child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const SizedBox(height: 8,),
              Image.network(model.image, width: 75, height: 75,),
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12,),
                  Text(model.name, maxLines: 1,),
                  const SizedBox(height: 2,),
                   Text("\$${model.price}",
                    style: const TextStyle(fontWeight: FontWeight.bold),),
                ],),
            ],)
        ),
      ),
    );
  }
}
