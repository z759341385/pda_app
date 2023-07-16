import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


/// 统一弹吐司类
class ToastUtils {

  static bool isShowToast = true;

  ///弹吐司
  static void showToast(String content,
      {Toast length = Toast.LENGTH_LONG,
        ToastGravity gravity = ToastGravity.CENTER,
        Color backColor = Colors.black,
        Color textColor = Colors.white}) {
    if(!isShowToast){
      return;
    }
    if (content.isNotEmpty) {
      Fluttertoast.showToast(
          msg: content,
          toastLength: length,
          gravity: gravity,
          timeInSecForIosWeb: 1,
          backgroundColor: backColor,
          textColor: textColor,
          fontSize: 14.0);
    }
  }


  static cancelToast(){
    if(!isShowToast){
      return;
    }
    Fluttertoast.cancel();
  }

  static showToastCenter(String content) {
    showToast(
      content,
      gravity: ToastGravity.CENTER,
    );
  }
}