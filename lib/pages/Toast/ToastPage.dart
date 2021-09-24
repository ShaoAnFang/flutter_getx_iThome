import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_home/component/LoadingToast.dart';
import 'package:it_home/component/TextToast.dart';

class ToastPage extends StatelessWidget {
  const ToastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ToastPage')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CupertinoButton(
              child: Text("TextToast"),
              onPressed: () {
                TextToast.show("TextToast");
              },
            ),
            CupertinoButton(
                child: Text("Loading OverLay"),
                onPressed: () {
                  LoadingToast().show();
                }),
            CupertinoButton(
                child: Text("Loading OverLay with text"),
                onPressed: () {
                  LoadingToast().show(message: "with text");
                }),
          ],
        ),
      ),
    );
  }
}
