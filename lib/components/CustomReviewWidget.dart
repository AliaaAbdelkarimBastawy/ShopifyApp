import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Review.dart';

class CustomReviewWidget extends StatelessWidget {
  Review model;
   CustomReviewWidget({
    super.key,
     required this.model
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(top: 6.0),
      child: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CircleAvatar(backgroundColor: Colors.pinkAccent,child:
             Text(model.name[0], style: const TextStyle(color: Colors.white),),),
            const SizedBox(width: 8,),
            Container(
              width: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name, style: const TextStyle(fontWeight: FontWeight.bold),),
                  Text(model.comment,
                    maxLines: 4,
                    overflow: TextOverflow.fade,)
                ],),
            ),
             Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(model.date),
            )
          ],),
      ),
    );
  }
}