import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingToast {
  static LoadingToast instance = LoadingToast._internal();
  factory LoadingToast() => instance;
  LoadingToast._internal();

  BuildContext context = Get.overlayContext!;
  bool needToRemove = true;
  late OverlayEntry overlayEntry;

  void show({String message = "", double seconds = 3}) {
    overlayEntry = OverlayEntry(builder: (context) {
      return Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: Get.width * 0.3,
            height: Get.width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.3),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: message == ""
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceAround,
                children: [
                  CircularProgressIndicator(strokeWidth: 3),
                  _buildText(message),
                ],
              ),
            ),
          ),
        ),
      );
    });

    Overlay.of(Get.overlayContext!).insert(overlayEntry);
    needToRemove = true;
    final millisecond = (seconds * 1000).toInt();
    Future.delayed(Duration(milliseconds: millisecond)).then((value) {
      if (needToRemove) {
        overlayEntry.remove();
      }
    });
  }

  static Widget _buildText(String message) {
    return message == ""
        ? SizedBox()
        : Text(
            message,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 17, color: Colors.white),
          );
  }
}
