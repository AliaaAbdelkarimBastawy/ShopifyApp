import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/Views/ProductsOfSpecificCategoryView.dart';
import 'package:shopify_app/models/Ads.dart';
import 'package:shopify_app/models/Category.dart';

import '../Views/ProductDetailsView.dart';
import '../constants.dart';
import '../main.dart';
import '../models/Product.dart';
import 'CustomAdsItem.dart';
import 'CustomCategroyItem.dart';
import 'CustomProductsItem.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({Key? key}) : super(key: key);

  CollectionReference categories = FirebaseFirestore.instance.collection(
      kCategoriesCollections);
  CollectionReference products = FirebaseFirestore.instance.collection(
      kProductsCollections);
  CollectionReference ads = FirebaseFirestore.instance.collection(
      kAdsCollections);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
            children: [
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 16,
              ),
              StreamBuilder(
                  stream: categories.snapshots(), builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<CategoryModel> categoriesList = [];
                  List<String> categoriesIDsList = [];
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    categoriesList.add(
                        CategoryModel.fromJson(snapshot.data!.docs[i]));
                    categoriesIDsList.add(snapshot.data!.docs[i].id);
                  }
                  return SizedBox(
                    height: 116,
                    child: ListView.builder(
                        itemCount: categoriesList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ProductsOfSpecificCategoryView.id,
                                    arguments: [
                                      categoriesList[index].categoryName,
                                      categoriesIDsList[index]
                                    ]);
                              },
                              child: CustomCategoryItem(
                                categoryName: categoriesList[index]
                                    .categoryName,
                                categoryImage: categoriesList[index]
                                    .categoryImage,
                              ),
                            ),
                          );
                        }
                    ),);
                }
                else {
                  return const Center(child: Text('Loading....'));
                }
              }),
              const Spacer(flex: 3,),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Latest",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 8,),

              StreamBuilder(
                stream: ads.snapshots(), builder: (context, snapshot){
                  if (snapshot.hasData)
              {
                List<AdsModel> adsList = [];

                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  adsList.add(AdsModel.fromJson(snapshot.data!.docs[i]));

                }
                return  SizedBox(
                  height: 175,
                  child: ListView.builder(
                      itemCount: adsList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CustomAdsItem(
                            adsName: adsList[index].adsName,
                            adsImage: adsList[index].adsImage,
                          ),
                        );
                      }
                      ),
                  );
              }
                  else {
              return const Center(child: Text('Loading....'));
              }}
              ),

              const Spacer(flex: 5,),

              StreamBuilder(
                  stream: products.snapshots(), builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Product> productsList = [];
                  List<String> categoriesList = [];
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    productsList.add(
                        Product.fromJson(snapshot.data!.docs[i]));
                    Product product = Product.fromJson(snapshot.data!.docs[i]);
                    categoriesList.add(product.CategoryID);
                  }
                  return SizedBox(
                    height: 170,
                    child: ListView.builder(
                        itemCount: productsList.length, scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: GestureDetector(onTap: () {
                                Navigator.pushNamed(
                                    context, ProductDetailsView.id);
                              },
                                  child: GestureDetector(
                                    onTap: () async
                                      {
                                        DocumentSnapshot categorySnapshot = await categories.doc(categoriesList[index]).get();
                                        Map<String, dynamic>? data = categorySnapshot.data() as Map<String, dynamic>?;
                                        String categoryName = data?['name'] ?? 'No Name';

                                       if(context.mounted)
                                         {
                                           Navigator.pushNamed(context, ProductDetailsView.id,
                                               arguments: [productsList[index],categoryName ]);
                                         }

                                      },
                                      child: CustomProductsItem(model: productsList[index],))));
                        }),);
                }

                else {
                  return const Center(child: Text('Loading....'));
                }
              }
              ),
              const SizedBox(height: 20,),
              const Spacer(flex: 4,),
            ]));
  }
}

