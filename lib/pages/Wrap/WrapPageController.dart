import 'dart:math';
import 'package:get/get.dart';

class WrapPageController extends GetxController {
  final _chipList = <String>[].obs;
  get chipList => _chipList.toList();

  @override
  void onInit() {
    super.onInit();
  }

  addChipData() {
    Random random = Random();
    int randomNumber = random.nextInt(200);
    _chipList.add("$randomNumber");
  }

  removeChipData(int index) {
    _chipList.removeAt(index);
  }
}
