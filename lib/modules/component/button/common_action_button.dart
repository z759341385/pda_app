import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_example/http/request/api.dart';
import 'package:flutter_demo_example/styles/lables.dart';

///通用按钮组件
///1.防抖节流
class CommonActionButton extends StatefulWidget {
  String text;
  Function? onTap;
  CommonActionButton({required this.text, this.onTap});
  @override
  _CommonActionButtonState createState() => _CommonActionButtonState();
}

class _CommonActionButtonState extends State<CommonActionButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.onTap!.call();
      },
      child: Text(
        widget.text,
        style: black14Style,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.grey[200],
        ),
      ),
    );
  }
}
