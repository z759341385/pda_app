import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_example/http/request/api.dart';
import 'package:flutter_demo_example/styles/lables.dart';
import 'package:flutter_demo_example/utils/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/colours.dart';

///通用按钮组件
///1.防抖节流
class CommonActionButton extends StatefulWidget {
  String text;
  String hintText;
  Function? onTap;
  BorderRadiusGeometry? borderRadius;
  Color? backgroundColor;
  Color? disabledBackgroundColor;

  TextStyle? textStyle;
  TextStyle? hintTextStyle;

  bool disable;
  CommonActionButton(
      {required this.text,
        this.hintText = '',
        this.onTap,
        this.textStyle,
        this.hintTextStyle,
        this.borderRadius,
        this.disabledBackgroundColor = Colours.disableActiveColor,
        this.backgroundColor,
        this.disable = false});
  @override
  _CommonActionButtonState createState() => _CommonActionButtonState();
}

class _CommonActionButtonState extends State<CommonActionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: TextButton(
        onPressed: () {
          if (widget.disable && widget.onTap == null) return;
          widget.onTap!.call();
        },
        child: Text(
          widget.text,
          style: widget.disable
              ? TextStyle(color: Colours.disableWhiteColor, fontSize: 18.sp)
              : widget.textStyle ?? white16Style,
        ),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(0, 0)),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 18, vertical: 5)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: widget.borderRadius ?? BorderRadius.circular(4))),
          backgroundColor: MaterialStateProperty.all(
            widget.disable ? widget.disabledBackgroundColor  : widget.backgroundColor ?? Colours.activeColor,
          ),
        ),
      ),
    );
  }
}
