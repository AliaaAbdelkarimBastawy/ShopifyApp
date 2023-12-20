import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomProductsItem extends StatelessWidget {
  const CustomProductsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 8,
          color: const Color(0XFFF3F4F7),
        ),
      ),
      child:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            const SizedBox(height: 8,),
            Image.asset("assets/images/pants.png", width: 60, height: 60,),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8,),
                Text("Ankle Boots"),
                Text(r"$49.99",
                  style: TextStyle(fontWeight: FontWeight.bold),),
              ],),
          ],)
      ),
    );
  }
}
