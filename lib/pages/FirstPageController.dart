import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:it_home/entity/Person.dart';
import 'package:it_home/utils/UserDefault.dart';

class FirstPageController extends GetxController {
  final _dataList = [
    "CarouselSlidePage",
    "LottiePage",
    "ImagePickerPage",
    "ToastPage",
    "CachedImagePage",
    "WrapPage",
    "QRCodePage",
    "BindingPage",
    "ExtensionPage",
    "NewsPage"
  ].obs;
  get dataList => this._dataList.toList();

  @override
  void onInit() {
    print(UserDefault().userName);
    UserDefault().userName = "it_home_user";
    print(UserDefault().userName);

    super.onInit();
  }

  compateIfEqual() {
    final person = Person()
      ..name = "someone"
      ..id = "1"
      ..age = 5;

    final personTwo = Person()
      ..name = "sometwo"
      ..id = "2"
      ..age = 10;

    final isEqual =
        DeepCollectionEquality.unordered().equals(person, personTwo);
    print(isEqual);
  }
}
