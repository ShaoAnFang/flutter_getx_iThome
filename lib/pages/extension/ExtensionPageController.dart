import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtensionPageController extends GetxController
    with SingleGetTickerProviderMixin {
      
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> flipAnimation;

  @override
  void onInit() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    // animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    scaleAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 2.0), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 3.0), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 3.0, end: 2.0), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 1.0), weight: 25),
    ]).animate(animationController);

    flipAnimation = Tween(begin: 0.0, end: 2.0).animate(animationController);
    super.onInit();
  }

  animationStart() {
    animationController.forward(from: 0.0);
  }

  updateTransition(Locale local) {
    Get.updateLocale(local);
  }
}
