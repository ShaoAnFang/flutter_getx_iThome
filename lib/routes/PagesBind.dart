import 'package:get/get.dart';
import 'package:it_home/pages/Lottie/LottiePageController.dart';
import 'package:it_home/pages/NewsPage/NewsPageController.dart';
import 'package:it_home/pages/NewsPage/NewsPageRepositoryImpl.dart';
import 'package:it_home/pages/Toast/ToastPageController.dart';
import 'package:it_home/pages/Wrap/WrapPageController.dart';
import 'package:it_home/pages/bindingPage/BindingPageController.dart';
import 'package:it_home/pages/cached_network_image/CachedImagePageController.dart';
import 'package:it_home/pages/carousel_slider/CarouselSlidePageController.dart';
import 'package:it_home/pages/FirstPageController.dart';
import 'package:it_home/pages/extension/ExtensionPageController.dart';
import 'package:it_home/pages/image_pick/ImagePickerPageController.dart';
import 'package:it_home/pages/qr_code/QRCodePageController.dart';
import 'package:it_home/pages/qr_code/QRCodeScanPageController.dart';

class PagesBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstPageController>(() => FirstPageController());
    Get.lazyPut<CarouselSlidePageController>(
        () => CarouselSlidePageController());
    Get.lazyPut<LottiePageController>(() => LottiePageController());
    Get.lazyPut<ImagePickPageController>(() => ImagePickPageController());
    Get.lazyPut<CachedImagePageController>(() => CachedImagePageController());
    Get.lazyPut<ToastPageController>(() => ToastPageController());
    Get.lazyPut<WrapPageController>(() => WrapPageController());
    Get.lazyPut<QRCodePageController>(() => QRCodePageController());
    Get.lazyPut<QRCodeScanPageController>(() => QRCodeScanPageController());
    Get.lazyPut<BindingPageController>(() => BindingPageController());
    Get.lazyPut<ExtensionPageController>(() => ExtensionPageController());
    Get.lazyPut<NewsPageController>(() => NewsPageController(repository: NewsPageRepositoryImpl()));
  }
}
