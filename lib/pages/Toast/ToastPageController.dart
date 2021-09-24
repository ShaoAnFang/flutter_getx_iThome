import 'package:get/get.dart';

class ToastPageController extends GetxController {
  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  @override
  void onInit() {
    super.onInit();
  }
}
