import 'package:flutter/material.dart';
import 'package:flutter_demo_example/utils/share_prefrences_util.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SpTestVM extends ChangeNotifier {
  String _valueString = '';

  String get valueString => _valueString;

  setValue(String value) async {
    EasyLoading.show();
    bool status = await SpUtil.putString('test', value)!;
    EasyLoading.dismiss();
    if (status) {
      EasyLoading.showSuccess('success');
    } else {
      EasyLoading.showError('error');
    }
  }

  getValue() async {
    _valueString = SpUtil.getString('test');
    notifyListeners();
  }
}
