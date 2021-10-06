import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_home/pages/FirstPage.dart';
import 'package:it_home/routes/PagesBind.dart';
import 'package:it_home/utils/UserDefault.dart';

class PushNotificationManager {
  static Future<void> init() async {
    await Firebase.initializeApp();
    await requestPermission();
    await getToken();

    //iOS啟用前台通知
    if (Platform.isIOS) {
      // Required to display a heads up notification
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    //從關掉狀態點開推播
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print("從關掉狀態點開推播");
        print('on Resume(getInitial): $message');
        pushToPage(message);
      }
    });

    //App打開在前景時
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print("-------收到前景推播--------");
        print(message.notification!.body);
        print(message.notification!.title);
        if (Platform.isAndroid) showForegroundFakeNotification(message);
      }
    });

    //App退到背景,當回到App後 或是點了推播通知後
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //AndroidNotification? android = message.notification?.android;
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      print("App退到背景,當回到App後 或是點了推播通知後");
      pushToPage(message);
    });

    ///後台消息
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  }

  static getToken() async {
    if (Platform.isIOS) {
      String apnstoken = await FirebaseMessaging.instance.getAPNSToken() ?? "";
      print("APNSToken: $apnstoken");
    }
    String fcmToken = await FirebaseMessaging.instance.getToken() ?? "";
    print("FCMToken: $fcmToken");
    UserDefault().fcmToken = fcmToken;
  }

  static requestPermission() async {
    if (Platform.isIOS) {
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      print('User granted permission: ${settings.authorizationStatus}');
    }
  }
}

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  print("收到後臺訊息(onBackground): ${message.messageId}");
  print("後臺訊息title: ${message.notification!.title}");
  print("後臺訊息data: ${message.data.toString()}");
  await Firebase.initializeApp();
  pushToPage(message);
}

pushToPage(RemoteMessage message) {
  //這邊主要處理, 點開系統的推播通知後, 要push進哪一頁
  Get.offAll(() => FirstPage(), binding: PagesBind());
}

///安卓在App打開(前景)的時候系統不會有推播通知 利用GetX的snackbar 加一個假的
showForegroundFakeNotification(RemoteMessage message) async {
  final title = message.notification?.title ?? "";
  final body = message.notification?.body ?? "";
  Get.snackbar(
    title,
    body,
    barBlur: 50,
    icon: Image.asset('assets/ic_notification.png',
        fit: BoxFit.contain, width: 26, height: 26),
    duration: const Duration(seconds: 20),
    margin: const EdgeInsets.only(top: 4),
    onTap: (obj) {
      //print(obj);
      pushToPage(message);
    },
  );
}
