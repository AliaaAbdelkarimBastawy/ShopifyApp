import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../components/PaymentButton.dart';
import 'OrderIsDone.dart';

class CreditCardInfoView extends StatefulWidget {
   CreditCardInfoView({Key? key}) : super(key: key);

  static String id = "CreditCardInfoView";

  @override
  State<CreditCardInfoView> createState() => _CreditCardInfoViewState();
}

class _CreditCardInfoViewState extends State<CreditCardInfoView> {
   final GlobalKey<FormState> formKey = GlobalKey();

   String cardNumber = '';

   String cardHolderName = '';

   String expiryDate = '';

   String cvvCode = '';

   bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:const Color(0xFFF5F6F8),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor:const Color(0xFFF5F6F8),
        centerTitle: true,
        title: const Text('Credit Card', style: TextStyle(color: Colors.black),),),
      body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CreditCardWidget(cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      showBackView: showBackView,
                      onCreditCardWidgetChange: (value){

                      }),
                  CreditCardForm(
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      onCreditCardModelChange: (creditCardModel)
                      {
                        cardNumber = creditCardModel.cardNumber;
                        expiryDate = creditCardModel.expiryDate;
                        cardHolderName = creditCardModel.cardHolderName;
                        cvvCode = creditCardModel.cvvCode;
                        showBackView = creditCardModel.isCvvFocused;
                        setState(() {

                        });
                      },
                      formKey: formKey)
                ],),
             const Spacer(flex: 2,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PaymentButton(btnColor: Colors.green, txtColor: Colors.white, btnTxt: 'Pay',
                  onPressed: () {
                  Navigator.pushNamed(context, OrderIsDoneView.id);
                  },),
              ),
              const Spacer(flex: 2,),
            ],
          ),
        )
    );
  }
}
