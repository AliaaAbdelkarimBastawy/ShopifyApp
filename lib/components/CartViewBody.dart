import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/components/CustomisedBtn.dart';


import '../Views/CreditCardInfoView.dart';
import '../main.dart';
import 'CartItem.dart';
import 'ShareCustomBtn.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  static String id = "CartView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.only(left: 16,top: 16,
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
                Consumer<Model>(builder: (BuildContext context, Model value, Widget? child) {
                if(value.listOfPurchasedItems.isNotEmpty)
                  {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: value.listOfPurchasedItems.length,
                          itemBuilder: (context, index)
                          {
                            return CartItem(model: value.listOfPurchasedItems[index],);
                          }),
                    );
                  }
                
                else 
                  {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 120,),
                        Padding(
                          padding: const EdgeInsets.only(right: 32.0, bottom: 16),
                          child: Image.asset('assets/images/EmptyCart2.png',
                            height: 240,width: 240,),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                          child: Center(child: Text('Seems you haven’t added anything to your cart yet!')),
                        ),

                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(child: Text('Start shopping and add items')),
                        ),
                      ],
                    );
                  }
                }), 
                



                Consumer<Model>(builder: (BuildContext context, Model value, Widget? child) {
                  return Visibility(
                    visible: value.listOfPurchasedItems.isNotEmpty ? true: false,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      child: Divider(height: 10,
                        thickness: 2,
                        color: Color(0xFFBBBBBB),),
                    ),
                  );
                }),

                Consumer<Model>(builder: (BuildContext context, Model value, Widget? child) {
                  return Visibility(
                    visible: value.listOfPurchasedItems.isNotEmpty ? true: false,
                    child: Container(
                      height: 80,
                      color: const Color(0xFFF5F6F8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Consumer<Model>(builder: (BuildContext context, Model value, Widget? child) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('TOTAL'),
                                  const SizedBox(height: 4,),
                                  Text("\$ ${double.parse(value.totalPrice.toStringAsFixed(2))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                  const SizedBox(height: 4,),
                                  const Text('Free Domestic Shipping'),
                                ],
                              );
                            }),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, CreditCardInfoView.id);
                              },
                              child: ShareCustomBtn(
                                btnTxt: 'CHECKOUT',
                                txtColor: Colors.white,
                                btnColor: const Color(0xFFff0075),
                                btnIcon: Icons.arrow_forward_ios_outlined,),
                            ),
                          ],),
                      ),
                    ),
                  );
                }),

                // const SizedBox(height: 20,),
              ]),
        ),
      ),
    );
  }
}


