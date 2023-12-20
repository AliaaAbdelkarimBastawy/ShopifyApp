import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/models/Ads.dart';
import 'package:shopify_app/models/Category.dart';
import '../components/CustomAdsItem.dart';
import '../components/CustomCategroyItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../main.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  static String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CollectionReference categories = FirebaseFirestore.instance.collection('categories');
  CollectionReference ads = FirebaseFirestore.instance.collection('ads');

  getCategory() async {
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

  getAds() async {
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

  @override
  void initState() {
    getCategory();
    getAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions:const [
          Stack(
            children: [
              SizedBox(
                height: 26,
                width: 40,
              ),
              Icon(
                FontAwesomeIcons.comment,
                size: 20,
              ),
              Positioned(
                right: 5,
                bottom: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 8,
                  child: Center(child:
                  Text("1", style: TextStyle(color: Colors.white, fontSize: 12),)),
                ),
              )
            ],
          ),
          Stack(
            children: [
              SizedBox(
                height: 30,
                width: 40,
              ),
              Icon(
                Icons.notifications_none_outlined,
                size: 25,
                color: Colors.black,
              ),
              Positioned(
                right: 5,
                bottom: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 8,
                  child: Center(child:
                  Text("1", style: TextStyle(color: Colors.white, fontSize: 12),)),
                ),
              )
            ],
          ),

        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
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
              height: 10,
            ),
            Consumer<Model>(
              builder: (BuildContext context, Model value, Widget? child) {
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                      itemCount: value.categoriesList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CustomCategoryItem(
                            categoryName:
                                value.categoriesList[index].categoryName,
                          ),
                        );
                      }),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<Model>(
              builder: (BuildContext context, Model value, Widget? child) {
                return SizedBox(
                  height: 180,
                  child: ListView.builder(
                      itemCount: value.adsList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CustomAdsItem(
                            adsName: value.adsList[index].adsName,
                          ),
                        );
                      }),
                );
              },
            ),
            // const SizedBox(height: 20,),
          ])),
    );
  }
}
