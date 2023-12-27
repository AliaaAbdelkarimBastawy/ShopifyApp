import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/components/CustomisedBtn.dart';


import 'CartItem.dart';
import 'ShareCustomBtn.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.only(left: 16,
          right: 16, bottom: 8),
      child: Column(
          children: [
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Cart",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 16,
            ),
             Expanded(
               child: ListView.builder(
                 itemCount: 5,
                   itemBuilder: (context, index)
               {
                 return const CartItem();
               }),
             ),


            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(height: 10,
               thickness: 2,
               color: Color(0xFFBBBBBB),),
            ),

            Container(
              height: 80,
              color: const Color(0xFFF5F6F8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('TOTAL'),
                        SizedBox(height: 4,),
                        Text(r'$81.57', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        SizedBox(height: 4,),
                        Text('Free Domestic Shipping'),
                      ],
                    ),
                    ShareCustomBtn(
                      btnTxt: 'CHEKOUT',
                      txtColor: Colors.white,
                      btnColor: Colors.redAccent,
                      btnIcon: Icons.arrow_forward_ios_outlined,),
                ],),
              ),
            ),
            // const SizedBox(height: 20,),
          ]),
    );
  }
}


