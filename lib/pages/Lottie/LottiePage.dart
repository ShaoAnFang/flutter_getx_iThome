import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_home/component/loadingLottie.dart';
import 'package:it_home/pages/Lottie/LottiePageController.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends GetView<LottiePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LottiePage')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                color: Colors.blue[100],
                child: LoadingLottieView(),
              ),
            ),
            Lottie.network(
              'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
              controller: controller.animationController,
            ),
          ],
        ),
      ),
    );
  }
}
