import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_home/pages/qr_code/QRCodePageController.dart';
import 'package:it_home/routes/app_pages.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends GetView<QRCodePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('QRCodePage')),
        body: SafeArea(
            child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Scan QRCode', style: TextStyle(fontSize: 18)),
              Obx(
                () => GestureDetector(
                  onTap: () => controller.isGapless = !controller.isGapless,
                  child: SizedBox(
                    height: Get.width * 0.8,
                    width: Get.width * 0.8,
                    child: QrImage(
                      data: controller.qrCodeData,
                      version: QrVersions.auto,
                      size: Get.width * 0.7,
                      gapless: controller.isGapless,
                    ),
                  ),
                ),
              ),
              CupertinoButton(
                child: Text("QR code Scan"),
                color: Colors.blue,
                onPressed: () => Get.toNamed(AppRoutes.QRCodeScanPage),
              ),
            ],
          ),
        )));
  }
}
