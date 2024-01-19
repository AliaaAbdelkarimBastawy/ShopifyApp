import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/SwitchColor/Painter.dart';
import 'package:shopify_app/components/CartViewBody.dart';
import 'package:shopify_app/models/CartModel.dart';
import 'package:shopify_app/models/Product.dart';

import '../components/CustomReviewWidget.dart';
import '../components/CustomSelectColorWidget.dart';
import '../components/CustomSelectSizeWidget.dart';
import '../components/ShareCustomBtn.dart';
import '../constants.dart';
import '../main.dart';

class ProductDetailsView extends StatefulWidget {
   ProductDetailsView({Key? key,}) : super(key: key);

  static String id = "ProductDetailsView";

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}



class _ProductDetailsViewState extends State<ProductDetailsView> {

  int isColorSelected = -1;
  int isSizeSelected = -1;
  int currentIndex = 0;


  /* I see that the items list is already inside the
  build method, but there is a small mistake in my code.
  The colorList and selectedColor variables should be declared
  inside the _YourWidgetState class, not inside the build method.
  This ensures that the variables are part of the widget's state
  and will be preserved between rebuilds.*/

  Map<String, Color> colorList = {};
  Color selectedColor = Colors.grey;
  String selectedSize = 'L';
  String selectedColored = 'Red';


  @override
  Widget build(BuildContext context) {

    // Get the arguments from the route settings
    final List<dynamic> arguments = ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    // Access individual elements from the arguments list
    final Product model = arguments[0];
    final String categoryName = arguments[1];

    var items = [
      Painter(color: selectedColor, image: model.image),
      Painter(color: selectedColor, image: model.image),
      Painter(color: selectedColor, image: model.image),
      // Image.network(model.image,),
      // Image.network(model.image,),
      // Image.network(model.image,),
    ];



    return Consumer<Model>(builder: (BuildContext context, Model value, Widget? child)
        {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.black, //change your color here
              ),
              elevation: 0,
              backgroundColor:  Colors.white,
              centerTitle: true,
              title:  Text(model.name,
                style: const TextStyle(color: Colors.black),),
              actions:  [
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: GestureDetector(
                          onTap: ()
                          {
                            Navigator.pushNamed(context, CartViewBody.id);
                          },
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        left: -10,
                        bottom: -6,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 8,
                          child: Center(child:
                          Text("${value.lengthOfPurchasedList}", style: TextStyle(color: Colors.white, fontSize: 12),)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(r'$''${model.price}', style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold),),
                      const SizedBox(width: 8,),
                      Container(
                        width: 65,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFFff0075),
                        ),

                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star, size: 18, color: Colors.white,),
                            const SizedBox(width: 4,),
                            Text('${model.rate}', style: const TextStyle(
                                color: Colors.white, fontSize: 16),),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16,),
                  Column(
                    children: [
                      DotsIndicator(
                        dotsCount: items.length,
                        position: currentIndex,
                        decorator: const DotsDecorator(// Inactive color
                          activeColor: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16,),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: false,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                        items: items,
                      ),
                      const SizedBox(height: 16,),
                    ],
                  ),
                  // const Spacer(),

                  Expanded(
                    child: DefaultTabController(
                      length: 3,
                      child: Scaffold(
                        backgroundColor:  Colors.white,
                        appBar: AppBar(
                          backgroundColor:  Colors.white,
                          elevation: 0,
                          toolbarHeight: 1,
                          bottom: TabBar(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            indicator: BoxDecoration(
                              color: const Color(0xFFF5F6F8), // Customize the indicator color here
                              borderRadius:
                              BorderRadius.circular(20), // Adjust the border radius
                            ),
                            labelColor: const Color(0xFFff0075),
                            tabs: const [
                              Tab(text: 'Product',),
                              Tab(text: 'Details',),
                              Tab(text: 'Reviews',),
                            ],
                          ),
                        ),
                        body:  Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TabBarView(
                            children: [
                              Container(
                                color:  Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 12,),
                                    const Text('SELECT COLOR'),
                                    SizedBox(
                                      height: 90,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: model.color.length,
                                          itemBuilder: (context,index)
                                          {
                                            return GestureDetector(
                                              onTap: ()
                                              {
                                                setState(() {
                                                  selectedColored = model.color[index];
                                                  isColorSelected = index;
                                                  selectedColor=colorMap[model.color[index]]! ?? Colors.black;
                                                });
                                              },
                                              child: CustomSelectColorWidget(
                                                  isSelected: (isColorSelected == index) ? true : false,
                                                  WhichColor: colorMap[model.color[index]]! ?? Colors.black),
                                            );
                                          }),
                                    ),
                                    const Text('SELECT SIZE (US)'),
                                    const SizedBox(height: 24,),
                                    Container(
                                      height: 45,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:model.size.length,
                                          itemBuilder: (context,index)
                                          {
                                            return GestureDetector(
                                              onTap: ()
                                              {
                                                setState(() {
                                                  selectedSize = model.size[index];
                                                  isSizeSelected = index;
                                                });
                                              },
                                              child: CustomSelectSizeWidget(
                                                sizeTxt:model.size[index],
                                                isSelected: (isSizeSelected == index) ? true : false,),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color:  Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(flex: 2,),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 24.0, left: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('BRAND',style: TextStyle(fontWeight: FontWeight.w300)),
                                              const SizedBox(height: 4,),
                                              Text(model.brand,style: const TextStyle(fontWeight: FontWeight.bold))
                                            ],),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              const Text('SKU',style: TextStyle(fontWeight: FontWeight.w300)),
                                              const SizedBox(height: 4,),
                                              Text(model.sku,style: const TextStyle(fontWeight: FontWeight.bold))
                                            ],),
                                        ],
                                      ),
                                    ),
                                    const Spacer(flex: 2,),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 24.0, left: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('CONDITION',style: TextStyle(fontWeight: FontWeight.w300)),
                                              const SizedBox(height: 4,),
                                              Text(model.condition,style: const TextStyle(fontWeight: FontWeight.bold))
                                            ],),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              const Text('MATERIAL',style: TextStyle(fontWeight: FontWeight.w300)),
                                              const SizedBox(height: 4,),
                                              Text(model.material,style: const TextStyle(fontWeight: FontWeight.bold))
                                            ],),
                                        ],
                                      ),
                                    ),
                                    const Spacer(flex: 2,),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 24.0, left: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('CATEGORY',style: TextStyle(fontWeight: FontWeight.w300)),
                                              const SizedBox(height: 4,),
                                              Text(categoryName,style: const TextStyle(fontWeight: FontWeight.bold))
                                            ],),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              const Text('FITTING',style: TextStyle(fontWeight: FontWeight.w300)),
                                              const SizedBox(height: 4,),
                                              Text(model.fitting,style: const TextStyle(fontWeight: FontWeight.bold))
                                            ],),
                                        ],
                                      ),
                                    ),
                                    const Spacer(flex: 2,),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                  itemCount: model.reviews.length,
                                  itemBuilder: (context, index)
                                  {
                                    return  CustomReviewWidget(model: model.reviews[index],);
                                  }),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Divider(color: Colors.grey,
                      height: 35,thickness: 1,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShareCustomBtn(
                          btnTxt: 'SHARE THIS',
                          txtColor: Colors.grey,
                          btnColor: Colors.white,
                          btnIcon: Icons.arrow_upward,),

                        Consumer<Model>(builder: (BuildContext context, Model value, Widget? child) {
                          return  GestureDetector(
                            onTap: ()
                            {

                              value.addToPurchasedItemsList(CartModel(
                                  name: model.name,
                                  price: model.price,
                                  size: selectedSize,
                                  color: selectedColored,
                                  quantity: 1, image: model.image));

                              value.increaseLengthOfPurchasedList();
                              value.addToTotalPrice(model.price);
                            },
                            child: ShareCustomBtn(
                              btnTxt: 'ADD TO CART',
                              txtColor: Colors.white,
                              btnColor: const Color(0xFFff0075),
                              btnIcon: Icons.arrow_forward_ios_outlined,),
                          );
                        }),

                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });

  }
}



