import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_example/http/request/api.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ApiTestVM extends ChangeNotifier{
  String? _data;

  String? get data => _data;

  sendRequest() async {
    EasyLoading.show(status: '加载中...');
    Response response = await (Api().request(
      '/environment/water/river',
      method: Method.GET,
      queryParameters: {
        'key': '76e9fd4ba9e5c9af11deef0f419c03d0',
        'river': '长江流域',
      },
    ) as Future<Response<dynamic>>);
    _data = response.data;
    notifyListeners();
    EasyLoading.dismiss();
  }
}