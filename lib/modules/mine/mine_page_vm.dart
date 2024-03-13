import 'package:flutter/material.dart';
import 'package:flutter_demo_example/utils/share_prefrences_util.dart';
import 'package:flutter_demo_example/utils/user_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MinePageVM extends ChangeNotifier {
  String _valueString = '';
  String get valueString => _valueString;
  TextEditingController textEditingController = TextEditingController();
  login() async {
    EasyLoading.show();
    UserUtil.logSuccessFun('123');
    EasyLoading.dismiss();
    EasyLoading.showSuccess('登陆成功');
    notifyListeners();
  }
  logout(){
    UserUtil.logOutFun('123');
    EasyLoading.showSuccess('退出成功');
    notifyListeners();

  }

  getValue() async {
    _valueString = SpUtil.getString('test');
    notifyListeners();
  }
}
