
import 'package:flutter/material.dart';
import 'package:shopify_app/Views/HomeView.dart';
import 'package:shopify_app/Views/LoginView.dart';
import 'package:shopify_app/Views/ProductDetailsView.dart';
import 'package:shopify_app/Views/SignUpView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopify_app/models/CartModel.dart';
import 'package:shopify_app/models/Product.dart';
import 'package:shopify_app/services/FirebaseNotifications.dart';
import 'Views/CreditCardInfoView.dart';
import 'Views/ForgetPasswordView.dart';
import 'Views/OrderIsDone.dart';
import 'Views/ProductsOfSpecificCategoryView.dart';
import 'components/CartViewBody.dart';
import 'components/NotificationViewBody.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'models/Ads.dart';
import 'models/Category.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(ChangeNotifierProvider(create: (context) => Model(),
    child:  MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
          useMaterial3: false
      ),
      routes: {
        LoginView.id : (context) => const LoginView(),
        SignUpView.id : (context) =>  SignUpView(),
        HomeView.id : (context) =>  HomeView(),
        CartViewBody.id : (context) => const CartViewBody(),
        ProductDetailsView.id : (context) =>  ProductDetailsView(),
        CreditCardInfoView.id : (context) =>  CreditCardInfoView(),
        ForgetPasswordView.id : (context) => const ForgetPasswordView(),
        NotificationViewBody.id : (context) => NotificationViewBody(),
        OrderIsDoneView.id : (context) => const OrderIsDoneView(),
        ProductsOfSpecificCategoryView.id : (context) =>  ProductsOfSpecificCategoryView()
      },

      debugShowCheckedModeBanner: false,
      initialRoute: LoginView.id,
    ), ));
}


class Model extends ChangeNotifier
{
  List<CategoryModel> categoriesList =[];

  List<AdsModel> adsList =[];

  int lengthOfPurchasedList =0;
  int noOfUnreadNotifications = 0;
  List<String> notificationTitles=[];
  List<String> notificationDescriptions=[];
  List<DateTime> notificationDateTimes=[];

  List<CartModel> listOfPurchasedItems =[];
  double totalPrice = 0.0;


  resetOrder()
  {
    listOfPurchasedItems.clear();
    lengthOfPurchasedList =0;
    resetTotalPrice();
    notifyListeners();
  }
  increaseLengthOfPurchasedList()
  {
    lengthOfPurchasedList+=1;
    notifyListeners();
  }

  decreaseLengthOfPurchasedList()
  {
    lengthOfPurchasedList-=1;
    notifyListeners();
  }


  addToTotalPrice (double price)
  {
    totalPrice+=price;
    notifyListeners();
  }

  removeFromTotalPrice (double price)
  {
    totalPrice-=price;
    notifyListeners();
  }


  resetTotalPrice ()
  {
    totalPrice =0.0;
    notifyListeners();
  }

  addToPurchasedItemsList(CartModel cartModel) {
    if (listOfPurchasedItems.contains(cartModel)) {
      // If the item is already in the cart, find it and increase its quantity
      int index = listOfPurchasedItems.indexOf(cartModel);
      listOfPurchasedItems[index].quantity += 1;
    } else {
      // If the item is not in the cart, add it to the list
      cartModel.quantity = 1; // Set the initial quantity to 1
      listOfPurchasedItems.add(cartModel);
    }

    notifyListeners();
  }


  increaseQuantityOfProduct(CartModel cartModel)
  {
    int index = listOfPurchasedItems.indexOf(cartModel);
    listOfPurchasedItems[index].quantity += 1;
    increaseLengthOfPurchasedList();
    addToTotalPrice(listOfPurchasedItems[index].price);
    notifyListeners();
  }


  decreaseQuantityOfProduct(CartModel cartModel)
  {
    int index = listOfPurchasedItems.indexOf(cartModel);
    if(listOfPurchasedItems[index].quantity ==1)
      {
        listOfPurchasedItems[index].quantity = 0;
        removeToPurchasedItemsList(cartModel);
        resetTotalPrice();

      }
    else
      {
        listOfPurchasedItems[index].quantity -= 1;
        removeFromTotalPrice(listOfPurchasedItems[index].price);

      }

    decreaseLengthOfPurchasedList();
    notifyListeners();
  }


  removeToPurchasedItemsList (CartModel cartModel)
  {
    listOfPurchasedItems.remove(cartModel);
    notifyListeners();
  }


  addToNotificationsTitlesList (String title)
  {
    notificationTitles.add(title);
    notifyListeners();
  }

  addToNotificationsDescriptionsList (String description)
  {
    notificationDescriptions.add(description);
    notifyListeners();
  }

  addToNotificationDateTimesList (DateTime time)
  {
    notificationDateTimes.add(time);
    notifyListeners();
  }

  AddToAdsList (AdsModel model)
  {
    adsList.add(model);
    notifyListeners();
  }

  clearAllNotifications()
  {
    noOfUnreadNotifications=0;
    notifyListeners();
  }

}

