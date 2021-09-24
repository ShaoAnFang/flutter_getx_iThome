import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_home/pages/extension/ExtensionPageController.dart';

class ExtensionPage extends GetView<ExtensionPageController> {
  @override
  Widget build(BuildContext context) {
    //多國語系 螢幕長寬 dialog snackBar
    return Scaffold(
      appBar: AppBar(title: Text('ExtensionPage')),
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text("translation_service".tr,
                    style: TextStyle(fontSize: 22)),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Text("Translation"),
                      Card(
                        child: ListTile(
                            title: Text("eu_us"),
                            onTap: () => controller
                                .updateTransition(Locale('en', 'US'))),
                      ),
                      Card(
                        child: ListTile(
                            title: Text("zh_CN"),
                            onTap: () => controller
                                .updateTransition(Locale('zh', 'CN'))),
                      ),
                      Card(
                        child: ListTile(
                            title: Text("zh_TW"),
                            onTap: () => controller
                                .updateTransition(Locale('zh', 'TW'))),
                      ),
                      const SizedBox(height: 8),
                      Text("Getx Snackbar"),
                      Card(
                        child: ListTile(
                            title: Text("Snackbar show"),
                            onTap: () => Get.snackbar(
                                "Get.snackbar", "Get.snackbar Message")),
                      ),
                      const SizedBox(height: 8),
                      Text("Screen Info"),
                      Card(
                        child: ListTile(
                            title: Text(
                                "height: ${Get.height.toInt()}, width ${Get.width.toInt()}")),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: GetBuilder<ExtensionPageController>(
                  init: controller,
                  initState: (_) {},
                  tag: "imageFlip",
                  builder: (_) {
                    return AnimatedBuilder(
                      animation: controller.animationController,
                      builder: (context, child) {
                          return Transform(
                            child: child,
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..scale(controller.scaleAnimation.value,
                                  controller.scaleAnimation.value, 1)
                              ..rotateY(pi * controller.flipAnimation.value),
                          );
                      },
                      child: IconButton(
                        icon: Icon(Icons.ac_unit, size: 50),
                        onPressed: () => controller.animationStart(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
