import 'package:get/get.dart';

class CarouselSlidePageController extends GetxController {
  final _dataList = [].obs;
  get dataList => this._dataList;

  @override
  void onInit() {
    _dataList.assignAll(Iterable<int>.generate(10).toList());
    super.onInit();
  }
}
