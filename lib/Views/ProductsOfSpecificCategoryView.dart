import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/Views/ProductDetailsView.dart';
import 'package:shopify_app/components/CustomGridProductItem.dart';
import 'package:shopify_app/components/CustomProductsItem.dart';

import '../constants.dart';
import '../models/Product.dart';

class ProductsOfSpecificCategoryView extends StatelessWidget {
  ProductsOfSpecificCategoryView({Key? key}) : super(key: key);

  static String id = "ProductsOfSpecificCategoryView";

  CollectionReference products =
      FirebaseFirestore.instance.collection(kProductsCollections);

  @override
  Widget build(BuildContext context) {
    // Get the arguments from the route settings
    final List<dynamic> arguments = ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    // Access individual elements from the arguments list
    final String categoryName = arguments[0];
    final String categoryID = arguments[1];


    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFF5F6F8),
        centerTitle: true,
        title: Text(
          categoryName,
          style: const TextStyle(color: Colors.black, fontSize: 26),
        ),
      ),
      body: StreamBuilder(
          stream: products.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> productsList = [];
              for (int i = 0; i < snapshot.data!.docs.length; i++) {

                Product product = Product.fromJson(snapshot.data!.docs[i]);
                if(product.CategoryID == categoryID)
                  {
                    productsList.add(Product.fromJson(snapshot.data!.docs[i]));
                  }
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                    itemCount: productsList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 25,
                        childAspectRatio: 1.0,
                        mainAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, ProductDetailsView.id, arguments: [productsList[index], categoryName]);
                          },
                          child:  CustomGridProductsItem(model: productsList[index],));
                    }),
              );
            }
            else {
              return const Center(child: Text('Loading....'));
            }
          }
    ),
    );
  }
}
