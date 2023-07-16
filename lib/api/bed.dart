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
  /// Get 获取设备绑定状态
  Future<dynamic> getDeviceStatus(String devUid) async {
    String path = '/app/getDevState';
    Response response = await (Api().request(
      path,
      method: Method.GET,
      queryParameters: {
        'devUid':devUid
      },
    ));
    return response.data;
  }
  //e89f6d708f60
  /// 解绑设备
  Future<dynamic> unbindDevice(String devUid) async {
    String path = '/app/unbindBed';
    Response response = await (Api().request(
      path,
      method: Method.GET,
      queryParameters: {
        'devUid':devUid
      },
    ));
    return response.data;
  }
  /// 绑定设备
  Future<dynamic> bindDevice(String devUid,String bedId) async {
    String path = '/app/bindBed';
    Response response = await (Api().request(
      path,
      method: Method.GET,
      queryParameters: {
        'devUid':devUid,
        'bedId':bedId
      },
    ));
    return response.data;
  }
}
