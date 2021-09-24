import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

///Cell左滑出現的小選單
class SliderActionWidget extends StatelessWidget {
  const SliderActionWidget(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.iconData,
      required this.didSelected})
      : super(key: key);
  final String text;
  final Color? backgroundColor;
  final IconData iconData;
  final VoidCallback didSelected;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: IconSlideAction(
        caption: text,
        color: backgroundColor,
        icon: iconData,
        onTap: () => didSelected(),
      ),
    );
  }
}