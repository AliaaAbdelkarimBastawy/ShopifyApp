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
import 'package:shopify_app/services/FirebaseNotifications.dart';
import 'package:shopify_app/services/GetAdsService.dart';
import '../components/CustomAdsItem.dart';
import '../components/CustomCategroyItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



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

  int _currentIndex = 0;
  final tabs = [
     HomeViewBody(),
     CartViewBody(),
     ProfileViewBody(email: ''), // Initialize with an empty email
  ];
  @override
  void initState() {
    GetAdsService.getAds(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments;

    // Update the email in the ProfileViewBody widget
    tabs[2] = ProfileViewBody(email: email as String? ?? '');

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:const Color(0xFFF5F6F8),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () async
              {
                Navigator.pushNamed(context, NotificationViewBody.id);
              },
              child: Center(
                child: Consumer<Model>(builder: (BuildContext context, Model value, Widget? child)
                  {
                    return  SizedBox(
                      height: 24,
                      width: 35,
                      child:Stack(
                        children: [
                          const Icon(
                            Icons.notifications_none_rounded,
                            color: Colors.black,
                          ),
                          Visibility(
                            visible: value.noOfUnreadNotifications ==0? false : true,
                            child: Positioned(
                              right: 5,
                              bottom: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 8,
                                child: Center(child:
                                Text(value.noOfUnreadNotifications.toString(),
                                  style: TextStyle(color: Colors.white, fontSize: 12),)),
                              ),
                            ),
                          )
                        ],
                      ),);
                  }

              ),
            ),
          ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Column(
          children: [
            Expanded(child: tabs[_currentIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pinkAccent,
        items: const [
          BottomNavigationBarItem(
              icon: Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(Icons.home),
          ),
              label: 'Home',
          ),
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(Icons.shopping_cart),
          ),label: 'Cart'),
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(Icons.person),
          ),label: 'Profile'),
        ],
        onTap: (index)
        {
          setState(() {
            _currentIndex = index;
          });
        },

      ),
    );
  }


}
