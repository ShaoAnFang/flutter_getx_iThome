import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_home/component/CarouselSlide.dart';
import 'package:it_home/pages/carousel_slider/CarouselSlidePageController.dart';

class CarouselSlidePage extends GetView<CarouselSlidePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SliderListPage')),
      body: SafeArea(
        child: Center(
          child: CarouselSlide(
            dataList: controller.dataList,
            didSelected: (int index) {
              print("didTapped $index");
            },
          ),
        ),
      ),
    );
  }
}
