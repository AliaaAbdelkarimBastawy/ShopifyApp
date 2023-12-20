import 'package:flutter/material.dart';
import 'package:shopify_app/Views/HomeView.dart';
import 'package:shopify_app/Views/LoginView.dart';
import 'package:shopify_app/Views/SignUpView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'models/Ads.dart';
import 'models/Category.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(create: (context) => Model(),
    child:  MaterialApp(
      routes: {
        LoginView.id : (Context) => const LoginView(),
        SignUpView.id : (Context) =>  SignUpView(),
        HomeView.id : (Context) =>  HomeView(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LoginView.id,
    ), ));

}


class Model extends ChangeNotifier
{
  List<CategoryModel> categoriesList =[];

  List<AdsModel> adsList =[];

  AddToCategoriesList (CategoryModel model)
  {
    categoriesList.add(model);
    notifyListeners();
  }

  AddToAdsList (AdsModel model)
  {
    adsList.add(model);
    notifyListeners();
  }
}
