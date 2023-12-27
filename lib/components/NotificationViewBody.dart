import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/components/NotificationItem.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(bottom: 8),
      child: Column(
          children: [
            const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Notifications",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                )),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 16),
                child: ListView.separated(
                    itemCount: 5,
                    itemBuilder: (context, index)
                    {
                      return const NotificationItem();
                    },
                  separatorBuilder: (BuildContext context,
                      int index) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 110,right: 16.0),
                        child: Divider(thickness: 2,
                          color: Color(0xFFBBBBBB),
                            height: 10,),
                      );
                  },),
              ),
            ),


            // const SizedBox(height: 20,),
          ]),
    );
  }
}
