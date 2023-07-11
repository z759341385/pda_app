import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo_example/app/app_config.dart';
import 'package:flutter_demo_example/app/app_constans.dart';
import 'package:flutter_demo_example/http/interceptors/log.dart';

enum Method { GET, POST, PUT, DELETE, HEAD, PATH, DOWNLOAD }

class Api {
  Dio? _dio;
  static Api? _instance;

  factory Api() {
    if (_instance == null) _instance = Api._internal();
    return _instance!;
  }

  get dio => _dio;

  Api._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.instance!.config.baseUrl!,
        connectTimeout: 80000,
        headers: {
          // 'Authorization': 'Basic YXJ0aGVtaXM6YXJ0aGVtaXNfc2VjcmV0',
          // 'Tenant-Id': '000001',
          // 'User-Type': 'app',
        },
      ),
    );

    ///日志拦截器
    _dio!.interceptors.add(LogsInterceptors());

    // 证书校验
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    //   client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
  }

  Future request(
    path, {
    Method method = Method.GET,
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Map<String, dynamic>? header,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    options = Options(
      sendTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000,
      method: method.toString().split('.')[1],
    );
    // 自定义 header 配置
    Map<String, dynamic> headers = {'content-type': 'application/json'};
    if (ObjectUtil.isNotEmpty(AppConstants.versionName)) {
      headers.addAll({'Version': AppConstants.versionName});
      headers.addAll({'VersionCode': AppConstants.versionCode});
    }
    if (header != null) {
      headers.addAll(header);
    }
    options.headers = headers;
    // 处理请求
    Response response;
    try {
      response = await _dio!.request(path, data: data, options: options, queryParameters: queryParameters);
    } on DioError catch (e) {
      return e.response ?? {"message": '网络异常，请检查网络', "code": 0};
    }
    return response;
  }
}
