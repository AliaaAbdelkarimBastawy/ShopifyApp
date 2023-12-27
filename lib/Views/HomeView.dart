import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/Views/ProductDetailsView.dart';
import 'package:shopify_app/components/CartViewBody.dart';
import 'package:shopify_app/components/NotificationViewBody.dart';
import 'package:shopify_app/components/ProfileViewBody.dart';
import 'package:shopify_app/models/Ads.dart';
import 'package:shopify_app/models/Category.dart';
import 'package:shopify_app/services/GetAdsService.dart';
import '../components/CustomAdsItem.dart';
import '../components/CustomCategroyItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopify_app/services/GetCategoryService.dart';



import '../components/CustomProductsItem.dart';
import '../components/HomeViewBody.dart';
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
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:const Color(0xFFF5F6F8),
        actions:const [
          Center(
            child: SizedBox(
              height: 24,
              width: 35,
              child:Stack(
               children: [
                 Icon(
                   FontAwesomeIcons.comment,
                   color: Colors.black,
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
          ),
          Center(
            child: SizedBox(
              height: 24,
              width: 35,
              child:Stack(
                children: [
                  Icon(
                    Icons.notifications_none_rounded,
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
              ),),
          ),

        ],
        automaticallyImplyLeading: false,
      ),
      body:Column(
        children: [
          const Expanded(child: ProfileViewBody()),

          // Container(
          //   height: 75,
          //   color: Colors.blueGrey,),
        ],
      )
    );
  }


}
