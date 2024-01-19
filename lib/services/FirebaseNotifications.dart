
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/components/NotificationViewBody.dart';

import '../main.dart';
import '../main.dart';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/components/NotificationViewBody.dart';

import '../main.dart';

// Initialize the local notifications plugin
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/components/NotificationViewBody.dart';

import '../main.dart';

// Initialize the local notifications plugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> initLocalNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('app_icon');

  const InitializationSettings initializationSettings =
  InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
}

Future<void> initPushNotifications(BuildContext context) async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.instance.getInitialMessage().then((message) {
    handleMessage(context, message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    handleMessage(context, message);
  });

  FirebaseMessaging.onBackgroundMessage((message) async {
    await handleBackgroundMessage(context, message);
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    handleForegroundMessage(context, message);
  });
}

Future<void> handleBackgroundMessage(BuildContext context, RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');

  if (message == null) return;

  Provider.of<Model>(context, listen: false).noOfUnreadNotifications += 1;
  Provider.of<Model>(context, listen: false).addToNotificationsTitlesList(message.notification?.title ?? "");
  Provider.of<Model>(context, listen: false).addToNotificationsDescriptionsList(message.notification?.body ?? "");
  Provider.of<Model>(context, listen: false).addToNotificationDateTimesList(
    message.sentTime != null ? message.sentTime! : DateTime.now(),
  );


  print('HANDLEBACKGROUNDMESSAGE!!!${message.notification?.title} ${message.notification?.body}');
}

Future<void> handleForegroundMessage(BuildContext context, RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');

  if (message == null) return;

  Provider.of<Model>(context, listen: false).noOfUnreadNotifications += 1;
  Provider.of<Model>(context, listen: false).addToNotificationsTitlesList(message.notification?.title ?? "");
  Provider.of<Model>(context, listen: false).addToNotificationsDescriptionsList(message.notification?.body ?? "");
  Provider.of<Model>(context, listen: false).addToNotificationDateTimesList(
    message.sentTime != null ? message.sentTime! : DateTime.now(),
  );

  // Display a local notification when the app is in the foreground on Android
  _showLocalNotification(message.notification?.title, message.notification?.body);

  print('HANDLEFOREGROUNDMESSAGE!!!${message.notification?.title} ${message.notification?.body}');
}

Future<void> _showLocalNotification(String? title, String? body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    'your_channel_id',
    'your_channel_name',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false, // Add this line if not already present
  );

  const NotificationDetails platformChannelSpecifics =
  NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    title ?? '',
    body ?? '',
    platformChannelSpecifics,
  );
}

void handleMessage(BuildContext context, RemoteMessage? message) {
  if (message == null) return;

  Provider.of<Model>(context, listen: false).noOfUnreadNotifications += 1;
  Provider.of<Model>(context, listen: false).addToNotificationsTitlesList(message.notification?.title ?? "");
  Provider.of<Model>(context, listen: false).addToNotificationsDescriptionsList(message.notification?.body ?? "");
  print('HANDLEMESSAGE!!!${message.notification?.title} ${message.notification?.body}');
}
