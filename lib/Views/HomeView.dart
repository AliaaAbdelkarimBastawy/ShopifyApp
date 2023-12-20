import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/models/Ads.dart';
import 'package:shopify_app/models/Category.dart';
import '../components/CustomAdsItem.dart';
import '../components/CustomCategroyItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeView extends StatelessWidget {
   HomeView({Key? key}) : super(key: key);
  static String id = 'HomeView';

  CollectionReference categories = FirebaseFirestore.instance.collection('categories');
  CollectionReference ads = FirebaseFirestore.instance.collection('ads');


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder <QuerySnapshot>(
                future: categories.get(),
                builder: (context, snapshot)
            {

              List<CategoryModel> categoriesList =[];

              if(snapshot.hasData)
                {
                  for(int i =0; i<snapshot.data!.docs.length; i++)
                  {
                    categoriesList.add(CategoryModel.fromJson(snapshot.data!.docs[i]));
                  }
                  return SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: categoriesList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return  Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: CustomCategoryItem(categoryName: categoriesList[index].categoryName,),
                          );
                        }
                    ),
                  );
                }
              else
                {
                  return const Text("Categories data is loading!");
                }

            }),
              const SizedBox(height: 20,),

            FutureBuilder <QuerySnapshot>(
                future: ads.get(),
                builder: (context, snapshot)
                {

                  List<AdsModel> adsList =[];

                  if(snapshot.hasData)
                  {
                    for(int i =0; i<snapshot.data!.docs.length; i++)
                    {
                      adsList.add(AdsModel.fromJson(snapshot.data!.docs[i]));
                    }
                    return SizedBox(
                      height: 180,
                      child: ListView.builder(
                          itemCount: adsList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return  Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CustomAdsItem(adsName:adsList[index].adsName, ),
                            );
                          }
                      ),
                    );
                  }
                  else
                  {
                    return const Text("Ads data is loading!");
                  }

                }),
              // const SizedBox(height: 20,),

        ]
            )
        ),
    );
  }
}



