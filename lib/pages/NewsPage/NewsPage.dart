import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_home/component/ShimmerWidget.dart';
import 'package:it_home/pages/NewsPage/NewsPageController.dart';

class NewsPage extends GetView<NewsPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NewsPage')),
      body: SafeArea(
        child: Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            switchInCurve: Curves.easeIn,
            child: (controller.isLoading)
                // ? Center(child: CircularProgressIndicator())
                ? ListViewShimmer(key: ValueKey<int>(0))
                : ListView.builder(
                    key: ValueKey<int>(1),
                    itemCount: controller.dataList.length,
                    itemBuilder: (_, index) {
                      final title = controller.dataList[index].title;
                      final description = controller.dataList[index].description;
                      return Card(
                        child: ListTile(
                          title: Text(title),
                          subtitle: Text(description),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
