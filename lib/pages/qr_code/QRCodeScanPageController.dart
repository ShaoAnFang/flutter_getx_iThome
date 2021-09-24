import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanPageController extends GetxController {
  final _scanResult = Barcode("", BarcodeFormat.code93, null).obs;
  set scanResult(value) => this._scanResult.value = value;
  get scanResult => this._scanResult.value;

  QRViewController? qrViewController;

  void onQRViewCreated(QRViewController qrViewController) {
    this.qrViewController = qrViewController;
    qrViewController.scannedDataStream.listen((scanData) {
      scanResult = scanData;
    });
  }

  cleanScanResult() {
    scanResult = Barcode("", BarcodeFormat.code93, null);
  }
}
