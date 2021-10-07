import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_home/pages/Translations_local/TranslationService.dart';
import 'package:it_home/routes/app_pages.dart';
import 'package:it_home/utils/ConnectivityManager.dart';
import 'package:it_home/utils/PushNotificationManager.dart';
import 'package:it_home/utils/UserDefault.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConnectivityManager().init();
  await UserDefault().init();
  HttpOverrides.global = MyHttpOverrides();
  // await PushNotificationManager.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initPage,
      getPages: AppPages.routes,
      enableLog: true,
      translations: TranslationService(),
      locale: Locale('en', 'US'),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    print(context);
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}