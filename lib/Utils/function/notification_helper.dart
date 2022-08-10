import 'package:cicgreenloan/Utils/function/on_message_open_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:rxdart/subjects.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String?> selectNotificationSubject =
    BehaviorSubject<String?>();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');
RemoteMessage? selectedNotificationPayload;
final onMessageOpenApp = OnMessageOpenApp();

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

class NotificationHelper {
  static Future<void> initial() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_notf_icon');
    IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: (id, title, body, payload) async {
      didReceiveLocalNotificationSubject.add(
        ReceivedNotification(
          id: id,
          title: title,
          body: body,
          payload: payload,
        ),
      );
    });
    const MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: initializationSettingsMacOS);
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {}
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      onMessageOpenApp.onMessageOpenApp(
          Get.context!, selectedNotificationPayload!);
      debugPrint(
          "on Messaging:${selectedNotificationPayload!.notification!.title}");

      selectNotificationSubject.add(payload);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      selectedNotificationPayload = remoteMessage;
      NotificationHelper.showNotification(
          title: remoteMessage.notification!.title,
          body: remoteMessage.notification!.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
      onMessageOpenApp.onMessageOpenApp(Get.context!, event);
    });
  }

  static Future<void> showNotification({String? title, String? body}) async {
    showTextNotification(
        title: title,
        body: body,
        flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin);
  }

  static Future<void> showTextNotification(
      {String? title,
      String? body,
      FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'home_material',
      'home_material',
      playSound: true,
      importance: Importance.max,
      priority: Priority.max,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin!.show(
        0, title, body, platformChannelSpecifics,
        payload: selectedNotificationPayload.toString());
  }
}
