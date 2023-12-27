import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/CustomSelectColorWidget.dart';
import '../components/CustomSelectSizeWidget.dart';
import '../components/ShareCustomBtn.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  static String id = "ProductDetailsView";

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}
int isColorSelected = -1;
int isSizeSelected = -1;


class _ProductDetailsViewState extends State<ProductDetailsView> {

  final items = [
    Image.asset('assets/images/dresses.png'),
    Image.asset('assets/images/pants.png'),
    Image.asset('assets/images/dresses.png'),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Color> ColorsList = [const Color(0xFFFF405C), Colors.lightGreen, Colors.orange,
      Colors.purple, Colors.brown, Colors.limeAccent,Colors.black, Colors.blue];

    List<String> SizeList = ['4.5', '5.0', '5.5',
      '6.0', '6.5', '7.0','7.5', '8.0'];
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  const Color(0xFFF5F6F8),
        centerTitle: true,
        title: const Text('Faux Sued Ankle Boots',
          style: TextStyle(color: Colors.black),),
        actions: const [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  left: -10,
                  bottom: -6,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 8,
                    child: Center(child:
                    Text("1", style: TextStyle(color: Colors.white, fontSize: 12),)),
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
                const Text(r'$49.99', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),),
                const SizedBox(width: 8,),
                Container(
                  width: 65,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.redAccent,
                  ),

                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, size: 18, color: Colors.white,),
                      SizedBox(width: 4,),
                      Text('4.9', style: TextStyle(
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
                  backgroundColor:  const Color(0xFFF5F6F8),
                  appBar: AppBar(
                    backgroundColor:  const Color(0xFFF5F6F8),
                    elevation: 0,
                    toolbarHeight: 1,
                    bottom: TabBar(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      indicator: BoxDecoration(
                        color: Colors.white, // Customize the indicator color here
                        borderRadius:
                        BorderRadius.circular(20), // Adjust the border radius
                      ),
                      labelColor: Colors.redAccent,
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
                         color:  const Color(0xFFF5F6F8),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             const SizedBox(height: 12,),
                             const Text('SELECT COLOR'),
                             SizedBox(
                               height: 90,
                               child: ListView.builder(
                                   scrollDirection: Axis.horizontal,
                                   itemCount: ColorsList.length,
                                   itemBuilder: (context,index)
                                   {
                                     return GestureDetector(
                                       onTap: ()
                                       {
                                         print('Tapped');
                                         print(index);
                                         setState(() {
                                           isColorSelected = index;
                                         });
                                       },
                                       child: CustomSelectColorWidget(
                                         isSelected: (isColorSelected == index) ? true : false,
                                         WhichColor: ColorsList[index],),
                                     );
                                   }),
                             ),
                             const Text('SELECT SIZE (US)'),
                             const SizedBox(height: 24,),
                             Container(
                               height: 45,
                               child: ListView.builder(
                                   scrollDirection: Axis.horizontal,
                                   itemCount: SizeList.length,
                                   itemBuilder: (context,index)
                                   {
                                     return GestureDetector(
                                       onTap: ()
                                       {
                                         setState(() {
                                           isSizeSelected = index;
                                         });
                                       },
                                       child: CustomSelectSizeWidget(
                                         sizeTxt:SizeList[index],
                                         isSelected: (isSizeSelected == index) ? true : false,),
                                     );
                                   }),
                             ),
                           ],
                         ),
                       ),
                        Icon(Icons.directions_transit),
                        Icon(Icons.directions_bike),
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
                  ShareCustomBtn(
                    btnTxt: 'ADD TO CART',
                    txtColor: Colors.white,
                    btnColor: Colors.redAccent,
                    btnIcon: Icons.arrow_forward_ios_outlined,),
                ],
              ),
            )
          ],
        ),
      ),
      );

  }
}



