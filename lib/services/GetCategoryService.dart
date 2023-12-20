import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/Category.dart';

class GetCategoriesService
{
  static CollectionReference categories = FirebaseFirestore.instance.collection('categories');
  static getCategory(BuildContext context) async {
    try {
      QuerySnapshot querySnapshot = await categories.get();
      querySnapshot.docs.forEach((doc) {
        Provider.of<Model>(context, listen: false)
            .AddToCategoriesList(CategoryModel.fromJson(doc));
      });
    } catch (e) {
      print('Error fetching Categories: $e');
    }
  }

}