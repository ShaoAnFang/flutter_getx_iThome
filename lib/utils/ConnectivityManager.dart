import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityManager {
  final Connectivity _connectivity = Connectivity();
  init() async {
    //App launch check once
    final reslut = await _connectivity.checkConnectivity();
    resultHandler(reslut);

    _connectivity.onConnectivityChanged.listen((result) {
      //At app using, if network changed
      resultHandler(result);
    });
  }

  resultHandler(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      Future.delayed(Duration(seconds: 1)).then((value) {
        Get.snackbar(
          "當前狀態無網路",
          "請檢查網路連線",
          duration: Duration(days: 1),
          icon: Icon(Icons.signal_wifi_bad),
        );
      });
    } else {
      if (Get.isSnackbarOpen != null) {
        if (Get.isSnackbarOpen!) Get.back();
      }
    }
  }
}
