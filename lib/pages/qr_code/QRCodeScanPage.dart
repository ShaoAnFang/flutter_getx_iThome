import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_home/pages/qr_code/QRCodeScanPageController.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanPage extends GetView<QRCodeScanPageController> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.scanResult.code == ""
          ? _buildQrView(context)
          : _buildScanResultView(context)),
    );
  }

  Widget _buildScanResultView(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(controller.scanResult.code),
          ),
          CupertinoButton(
            onPressed: () {
              controller.cleanScanResult();
              Get.back();
            },
            child: Text(
              "確認並返回",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = Get.width;
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: controller.onQRViewCreated,
          overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: scanArea),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CupertinoButton(
                color: Colors.blue,
                onPressed: () => Get.back(),
                child: Text('返回')),
          ),
        ),
      ],
    );
  }
}
