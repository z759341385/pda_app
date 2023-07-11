import 'package:flutter/material.dart';
import 'package:flutter_demo_example/styles/colours.dart';
import 'package:flutter_demo_example/styles/lables.dart';
import 'package:flutter_demo_example/utils/global.dart';

class ComAppBar extends AppBar{

  ComAppBar.title(
      {List<Widget>? actions,
        bool hasBackView = true,
        PreferredSizeWidget? bottom,
        Color backgroundColor = Colors.white,
        Function? backCallBack,
        Function? titleDoubleClick,
        Color? titleColor,
        required String title,
        Brightness brightness = Brightness.light,
        double elevation = 0})
      : super(
    centerTitle: true,
    title: GestureDetector(
      onDoubleTap: titleDoubleClick as void Function()?,
      child: Container(
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: black16Style,
        ),
      ),
    ),
    brightness: brightness,
    backgroundColor: backgroundColor,
    elevation: elevation,
    leading: !hasBackView
        ? null
        : new GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (backCallBack != null) {
            backCallBack.call();
          } else {
            Navigator.of(Global.navigatorKey.currentContext!).pop();
          }
        },
        child: Icon(Icons.arrow_back, size: 26, color: titleColor ?? Colours.title)),
    actions: actions ?? [],
    bottom: bottom,
  );
}