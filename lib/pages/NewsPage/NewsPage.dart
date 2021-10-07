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
            duration: const Duration(milliseconds: 500),
            child: (controller.isLoading)
                // ? Center(child: CircularProgressIndicator())
                ? ListViewShimmer(key: ValueKey<int>(0))
                : ListView.builder(
                    key: ValueKey<int>(1),
                    itemCount: controller.dataList.length,
                    itemBuilder: (_, index) {
                      final title = controller.dataList[index].title;
                      final content = controller.dataList[index].content;
                      return Card(
                        child: ListTile(
                          title: Text(title),
                          subtitle: Text(content),
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
