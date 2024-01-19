import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAdsItem extends StatelessWidget {
  String adsName;
  String adsImage;
   CustomAdsItem({
    super.key,
    required this.adsName,
     required this.adsImage
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image:  DecorationImage(
                image: NetworkImage(adsImage),
                fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(16),
            color: Colors.purple,
          ),
          height: 200,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.only(top: 20,left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               SizedBox(
                width: 140,
                child: Text(adsName, style: const TextStyle(fontSize: 18,
                    color: Colors.white,fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 10,),
              Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32)
              ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("SEE MORE"),
                    ),
                    CircleAvatar(radius: 20,
                      backgroundColor: Colors.pink,
                      child: Icon(Icons.arrow_forward_ios_outlined,
                        color: Colors.white, size: 16,),
                    ),
                  ],),
                ),)
            ],),
          )
        ),
      ],
    );
  }
}
