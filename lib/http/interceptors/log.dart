import 'dart:developer';

import 'package:dio/dio.dart';

///TODO InterceptorsWrapper写法升级
class LogsInterceptors extends InterceptorsWrapper {
  // @override
  // _onRequest(RequestOptions options) async {
  //   print("请求url：${options.uri.toString()}");
  //   print("请求method：${options.method}");
  //   print('请求头: ' + options.headers.toString());
  //   if (options.data != null) {
  //     print('data: ' + options.data.toString());
  //   }
  //   if (options.queryParameters != null) {
  //     print('queryParameters： ' + options.queryParameters.toString());
  //   }
  //   return options;
  // }
  //
  // @override
  // _onResponse(Response response) async {
  //   if (response != null) {
  //     log('返回参数: ' + response.toString());
  //   }
  //   return response;
  // }
  //
  // @override
  // _onError(DioError err) async {
  //   print('请求异常: ' + err.toString());
  //   print('请求异常信息: ' + err.response?.toString() ?? "");
  //   return err.response;
  // }

}