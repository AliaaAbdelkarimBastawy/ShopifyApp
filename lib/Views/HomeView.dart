import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/models/Ads.dart';
import 'package:shopify_app/models/Category.dart';
import 'package:shopify_app/services/GetAdsService.dart';
import '../components/CustomAdsItem.dart';
import '../components/CustomCategroyItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopify_app/services/GetCategoryService.dart';



import '../main.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  static String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    GetCategoriesService.getCategory(context);
    GetAdsService.getAds(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions:const [
          SizedBox(
            height: 24,
            width: 35,
            child:Stack(
             children: [
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
          ),),
          SizedBox(
            height: 24,
            width: 35,
            child:Stack(
              children: [
                Icon(
                  Icons.notifications_none_rounded,
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
            ),),

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
