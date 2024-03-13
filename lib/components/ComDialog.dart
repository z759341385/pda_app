import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_example/styles/colours.dart';
import 'package:flutter_demo_example/styles/lables.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/global.dart';

class ComDialog {
  static showTipDialog(
      {String title = '',
      bool onlyRight = true,
      bool onlyTitle = false,
      String content = '',
      String leftText = '取消',
      String rightText = '确定',
      Function? okCallBack,
      Function? cancelCallBack,
     }) {
    showDialog(
        context: Global.navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return SassDialog(
              title: title,
              content: content,
              leftText: leftText,
              onlyTitle: onlyTitle,
              rightText: rightText,
              onlyRight: onlyRight,
              okCallBack: okCallBack,
              cancelCallBack: cancelCallBack,
             );
        });
  }

  static showSendingDialog(
      {String title = '正在发送...',
      bool onlyRight = true,
      bool onlyTitle = false,
      String content = '发送中，请耐心等待。',
      String leftText = '取消',
      String rightText = '确定',
      Function? okCallBack,
      Function? cancelCallBack,
      bool input = false}) {
    showDialog(
        context: Global.navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return SassDialog(
            title: title,
            content: content,
            leftText: leftText,
            onlyTitle: onlyTitle,
            rightText: rightText,
            onlyRight: onlyRight,
            okCallBack: okCallBack,
            cancelCallBack: cancelCallBack,
          );
        });
  }
}

class SassDialog extends Dialog {
  final String title; //标题
  final String content; //内容
  final String leftText; //左边按钮文字
  final String rightText; //右边按钮文字
  final bool onlyRight; //右边按钮文字
  final Function? okCallBack; //右边回调
  final Function? cancelCallBack; //左边回调
  final bool obscureText; //是否展示输入框
  final bool onlyTitle; //是否只有标题
  final bool contentScrollable; //是否只有标题
  SassDialog(
      {this.title = '',
      this.content = '',
      this.leftText = '',
      this.rightText = '',
      this.onlyRight = false,
      this.okCallBack,
      this.cancelCallBack,
      this.contentScrollable = false,
      this.onlyTitle = false,
      this.obscureText = false});

  @override
  Widget build(BuildContext dContext) {
    TextEditingController _controller = TextEditingController();
    return Align(
      alignment: Alignment.center,
      child: Material(
        //创建透明层
        type: MaterialType.transparency, //透明类型
        //自定义dialog布局
        child: Container(
          width: 0.75.sw,
          decoration: BoxDecoration(
           color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 0.75.sw,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(),
                ),
                child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //标题
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                      child: Text(
                        title,
                        style: black17Style,
                      ),
                    ),
                    onlyTitle
                        ? Container(
                            padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(8),
                            ),
                          )
                        : //内容
                        Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(10),
                              horizontal: ScreenUtil().setWidth(20),
                            ).copyWith(bottom: 20.h),
                            child: contentScrollable
                                ? Container(
                                    height: 200.w,
                                    child: SingleChildScrollView(
                                      child: Container(
                                        child: Text(
                                          content,
                                          style:black14Style,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                  )
                                : Text(
                                    content,
                                    style: black14Style,
                                    textAlign: TextAlign.center,
                                  ),
                          ),
                  ],
                ),
              ),
              //按钮区
              Container(
                height: 48.w,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colours.borderColor, width: 1)),
                ),
                child: onlyRight
                    ?
                    //只有确定按钮
                    GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: Text(
                            rightText,
                            style: black14Style,
                          ),
                        ),
                        onTap: () {
                          if (okCallBack != null) {
                            //确认按钮回调
                            okCallBack!();
                          } else {
                            if (Navigator.canPop(Global.navigatorKey.currentContext!)) {
                              Navigator.of(dContext).pop();
                            }
                          }
                          // if (okRouteUri.isEmpty) {
                          //   Navigator.of(dContext).pop();
                          // } else {
                          //   //跳转页面，
                          //   Navigator.of(dContext).pop();
                          //   Navigator.of(dContext).pushNamed(okRouteUri);
                          // }
                        },
                      )
                    :
                    //双按钮
                    Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colours.borderColor, width: 1),
                                  ),
                                ),
                                child: Text(
                                  leftText,
                                  style: cbcbcb16Style,
                                ),
                              ),
                              onTap: () {
                                Navigator.of(dContext).pop();
                                if (cancelCallBack != null) {
                                  cancelCallBack!();
                                } else {
                                  if (Navigator.canPop(Global.navigatorKey.currentContext!)) {
                                    Navigator.of(dContext).pop();
                                  }
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  rightText,
                                  style: black16Style,
                                ),
                              ),
                              onTap: () {
                                if (okCallBack != null) {
                                  okCallBack!();
                                } else {
                                  if (Navigator.canPop(Global.navigatorKey.currentContext!)) {
                                    Navigator.of(dContext).pop();
                                  }
                                }
                                // if (okRouteUri.isEmpty) {
                                //   Navigator.of(dContext).pop();
                                // } else {
                                //   Navigator.of(dContext).pop();
                                //   Navigator.of(dContext).pushNamed(okRouteUri);
                                // }
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
