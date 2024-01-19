import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/Views/HomeView.dart';
import 'package:shopify_app/main.dart';

class OrderIsDoneView extends StatefulWidget {
  const OrderIsDoneView({Key? key}) : super(key: key);

  static String id = "OrderIsDoneView";

  @override
  State<OrderIsDoneView> createState() => _OrderIsDoneViewState();
}

class _OrderIsDoneViewState extends State<OrderIsDoneView> {

  @override
  void initState() {
    super.initState();
    context.read<Model>().resetOrder();
    // Wait for 30 seconds and then navigate to the next screen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, HomeView.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xFFF5F6F8),
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor:  const Color(0xFFF5F6F8),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 120,),
          Padding(
            padding: const EdgeInsets.only(left: 42.0),
            child: Image.asset('assets/images/OrderIsDone1.png',
              height: 240,width: 240,),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Center(child: Text('your Order is placed Successfully!',
              style: TextStyle(fontSize: 20, color: Colors.black),)),
          ),

        ],
      ),
    );
  }
}
