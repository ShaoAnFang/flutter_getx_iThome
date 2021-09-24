import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class LottiePageController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;

  @override
  void onInit() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    //只播放一次
    animationController.forward();

    //重複播放,reverse = true 跑完會倒著回放
    animationController.repeat(reverse: true);
    super.onInit();
  }
}
