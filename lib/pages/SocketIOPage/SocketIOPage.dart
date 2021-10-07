import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_home/pages/SocketIOPage/SocketIOPageController.dart';

class SocketIOPage extends GetView<SocketIOPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final stateString = controller.isOnConnect ? "已連線" : "未連線";
          return Text('聊天室 狀態: $stateString');
        }),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              controller.makeCall();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Obx(
            () {
              return Column(
                children: [
                  Expanded(child: _buildMessageListView()),
                  _buildTextFieldRow(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMessageListView() {
    return Container(
      color: Colors.grey.shade300,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.messageList.length,
        itemBuilder: (BuildContext context, int index) {
          final content = controller.messageList[index];
          return Text(content, style: TextStyle(fontSize: 20));
        },
      ),
    );
  }

  Widget _buildTextFieldRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller.textEditingController,
              style:
                  TextStyle(fontSize: 15.0, height: 1.5, color: Colors.black),
              decoration: InputDecoration(
                hintText: '請輸入訊息',
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.transparent,
                filled: true,
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(18, 14, 0, 14),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(5)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            height: 52,
            child: CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.blue,
              child: Icon(Icons.send),
              onPressed: () {
                controller.sendMessage();
              },
            ),
          ),
        ],
      ),
    );
  }
}
