import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLottieView extends StatelessWidget {
  const LoadingLottieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //後面有用到Getx可以替換成
      //height: Get.height,
      //width: Get.width,
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.height * 0.2,
      child: Transform.scale(
        scale: 1.3,
        child: Lottie.asset(
          'assets/lottie/loadingrepeatWhite.json',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
