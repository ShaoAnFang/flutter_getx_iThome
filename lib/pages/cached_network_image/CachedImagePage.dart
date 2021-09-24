import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_home/pages/cached_network_image/CachedImagePageController.dart';
import 'package:it_home/utils/ImageCache.dart';

class CachedImagePage extends GetView<CachedImagePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CachedImagePage')),
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ImageCached(
                    imageUrl:
                        '/assets/uploads/media-uploader/flutter-app-development-company1623499975.jpg'),
              ),
              Expanded(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Hello world!',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 500),
                    ),
                  ],
                  totalRepeatCount: 4,
                ),
              ),
              Expanded(
                child: AnimatedTextKit(
                  animatedTexts: [
                    FadeAnimatedText(
                      'Fade First',
                      textStyle: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.bold),
                    ),
                    ScaleAnimatedText(
                      'Then Scale',
                      textStyle:
                          TextStyle(fontSize: 70.0, fontFamily: 'Canterbury'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
