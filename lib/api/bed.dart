import 'package:dio/dio.dart';
import 'package:flutter_demo_example/http/request/api.dart';

class BedApi {
  /// Get 获取病床列表
  Future<dynamic> getBedList(String id) async {
    String path = '/app/getBedByDep?depId='+id;
    Response response = await (Api().request(
      path,
      method: Method.GET,

    ));
    return response.data;
    // return response.mapModel((json) => AttendGroupModel.fromJson(json));
  }

  /// Get 获取病区列表
  Future<dynamic> getDeptList() async {
    String path = '/app/getOffice';
    Response response = await (Api().request(
      path,
      method: Method.POST,
      queryParameters: {},
    ));
    return response.data;
  }
}
