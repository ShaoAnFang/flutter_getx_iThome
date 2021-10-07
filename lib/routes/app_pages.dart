import 'package:get/get.dart';
import 'package:it_home/pages/Lottie/LottiePage.dart';
import 'package:it_home/pages/NewsPage/NewsPage.dart';
import 'package:it_home/pages/SocketIOPage/SocketIOPage.dart';
import 'package:it_home/pages/Toast/ToastPage.dart';
import 'package:it_home/pages/Wrap/WrapPage.dart';
import 'package:it_home/pages/bindingPage/BindingPage.dart';
import 'package:it_home/pages/cached_network_image/CachedImagePage.dart';
import 'package:it_home/pages/carousel_slider/CarouselSlidePage.dart';
import 'package:it_home/pages/FirstPage.dart';
import 'package:it_home/pages/extension/ExtensionPage.dart';
import 'package:it_home/pages/image_pick/ImagePickerPage.dart';
import 'package:it_home/pages/qr_code/QRCodePage.dart';
import 'package:it_home/pages/qr_code/QRCodeScanPage.dart';
import 'package:it_home/routes/PagesBind.dart';
part 'app_routes.dart';

class AppPages {
  static const initPage = AppRoutes.FirstPage;
  static final routes = [
    GetPage(
      name: AppRoutes.FirstPage,
      page: () => FirstPage(),
      binding: PagesBind(),
      children: [
        GetPage(
          name: AppRoutes.CarouselSlidePage,
          page: () => CarouselSlidePage(),
          binding: PagesBind(),
        ),
        GetPage(
          name: AppRoutes.LottiePage,
          page: () => LottiePage(),
          binding: PagesBind(),
        ),
        GetPage(
          name: AppRoutes.ImagePickerPage,
          page: () => ImagePickerPage(),
          binding: PagesBind(),
        ),
        GetPage(
          name: AppRoutes.CachedImagePage,
          page: () => CachedImagePage(),
          binding: PagesBind(),
        ),
        GetPage(
          name: AppRoutes.ToastPage,
          page: () => ToastPage(),
          binding: PagesBind(),
        ),
        GetPage(
          name: AppRoutes.WrapPage,
          page: () => WrapPage(),
          binding: PagesBind(),
        ),
        GetPage(
          name: AppRoutes.QRCodePage,
          page: () => QRCodePage(),
          binding: PagesBind(),
        ),
        GetPage(
          name: AppRoutes.QRCodeScanPage,
          page: () => QRCodeScanPage(),
          binding: PagesBind(),
        ),
        GetPage(
          name: AppRoutes.BindingPage,
          page: () => BindingPage(),
          binding: PagesBind(),
        ),
        GetPage(
          name: AppRoutes.ExtensionPage,
          page: () => ExtensionPage(),
          binding: PagesBind(),
        ),
        GetPage(
          name: AppRoutes.NewsPage,
          page: () => NewsPage(),
          binding: PagesBind(),
        ),
        GetPage(
          name: AppRoutes.SocketIOPage,
          page: () => SocketIOPage(),
          binding: PagesBind(),
        ),
      ],
    ),
  ];
}
