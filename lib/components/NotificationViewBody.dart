import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/components/NotificationItem.dart';

import '../main.dart';

class NotificationViewBody extends StatefulWidget {
  NotificationViewBody({Key? key}) : super(key: key);

  static String id = 'NotificationViewBody';

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {


  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFF5F6F8),
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 16),
                  child: Consumer<Model>(builder: (BuildContext context, Model value, Widget? child) {
                    Provider.of<Model>(context, listen: false).clearAllNotifications();
                    return ListView.separated(
                        itemCount: value.notificationTitles.length,
                        itemBuilder: (context, index) {
                            return NotificationItem(
                              title: value.notificationTitles[index],
                              description: value.notificationDescriptions[index],
                              time: value.notificationDateTimes[index],
                            );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Padding(
                            padding: EdgeInsets.only(left: 110, right: 16.0),
                            child: Divider(
                              thickness: 1,
                              color: Color(0xFFBBBBBB),
                              height: 10,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
