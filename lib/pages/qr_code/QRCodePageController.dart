import 'package:get/get.dart';

class QRCodePageController extends GetxController {
  final _qrCodeData = ''.obs;
  set qrCodeData(value) => this._qrCodeData.value = value;
  get qrCodeData => this._qrCodeData.value;

  final _isGapless = false.obs;
  set isGapless(value) => this._isGapless.value = value;
  get isGapless => this._isGapless.value;

  @override
  void onInit() {
    qrCodeData = 'https://ithelp.ithome.com.tw/2021ironman';
    super.onInit();
  }
}
