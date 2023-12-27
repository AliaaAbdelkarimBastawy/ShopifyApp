import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'CustomAdsItem.dart';
import 'CustomCategroyItem.dart';
import 'CustomProductsItem.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                height: 16,
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

              Spacer(flex: 1,),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Latest",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 8,),
              Consumer<Model>(
                builder: (BuildContext context, Model value, Widget? child) {
                  return SizedBox(
                    height: 175,
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
              Spacer(flex: 1,),
              SizedBox(
                height: 170,
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: CustomProductsItem()
                      );
                    }),
              ),
              Spacer(flex: 4,),
              // const SizedBox(height: 20,),
            ]));
  }
}
