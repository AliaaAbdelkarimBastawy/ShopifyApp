import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/models/Ads.dart';

import '../main.dart';
import '../models/Category.dart';

class GetAdsService
{
  static CollectionReference ads = FirebaseFirestore.instance.collection('ads');
  static getAds(BuildContext context) async {
    try {
      QuerySnapshot querySnapshot = await ads.get();
      querySnapshot.docs.forEach((doc) {
        Provider.of<Model>(context, listen: false)
            .AddToAdsList(AdsModel.fromJson(doc));
      });
    } catch (e) {
      print('Error fetching Ads: $e');
    }
  }
}