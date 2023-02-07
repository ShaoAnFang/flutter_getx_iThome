import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:it_home/pages/FirstPageController.dart';

class FirstPage extends GetView<FirstPageController> {
  final controller = Get.put(FirstPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FirstPage')),
      body: SafeArea(
        child: Container(
          color: Colors.grey[50],
          child: _buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.dataList.length,
      itemBuilder: (BuildContext context, int index) {
        final title = controller.dataList[index];
        return _slidableCell(title);
      },
    );
  }

  Widget _slidableCell(String title) {
    return Slidable(
      // startActionPane: ActionPane(
      //   // A motion is a widget used to control how the pane animates.
      //   motion: const ScrollMotion(),

      //   // A pane can dismiss the Slidable.
      //   dismissible: DismissiblePane(onDismissed: () {}),

      //   // All actions are defined in the children parameter.
      //   children: [
      //     // A SlidableAction can have an icon and/or a label.
      //     SlidableAction(
      //       onPressed: (_) {},
      //       backgroundColor: Color(0xFFFE4A49),
      //       foregroundColor: Colors.white,
      //       icon: Icons.delete,
      //       label: 'Delete',
      //     ),
      //     SlidableAction(
      //       onPressed: (_) {},
      //       backgroundColor: Color(0xFF21B7CA),
      //       foregroundColor: Colors.white,
      //       icon: Icons.share,
      //       label: 'Share',
      //     ),
      //   ],
      // ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // padding: const EdgeInsets.all(5.0),
            foregroundColor: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            label: '選項1',
            backgroundColor: Colors.lightBlue[300]!,
            icon: Icons.drive_file_move_outline,
            onPressed: (_) {
              print("點擊了 $title 選項1");
            },
          ),
          SlidableAction(
            // spacing: 4,
            // padding: const EdgeInsets.all(4),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            label: '選項2',
            foregroundColor: Colors.white,
            backgroundColor: Colors.red[300]!,
            icon: Icons.delete_forever,
            onPressed: (_) => {},
          ),
        ],
      ),
      child: Card(
        elevation: 3.0,
        child: ListTile(
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () => Get.toNamed("/FirstPage/$title"),
        ),
      ),
    );
  }
}
