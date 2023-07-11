
enum HttpMethod { GET, POST, PUT, DELETE, HEAD, PATH, DOWNLOAD }

abstract class BaseRequest {
  var pathParams;
  bool userHttps = true;

  String domain() {
    return '';
  }

  HttpMethod httpMethod();
  String path();
  String url() {
    Uri uri;
    var pathStr = path();

    ///拼接参数
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }

    ///http https切换
    if (userHttps) {
      uri = Uri.https(domain(), pathStr, pathParams);
    } else {
      uri = Uri.http(domain(), pathStr, pathParams);
    }
    print('uri:${uri.toString()}');
    return uri.toString();
  }

  bool needLogin();
  Map<String, String> params = Map();

  ///添加参数
  BaseRequest add(String key, Object value) {
    params[key] = value.toString();
    return this;
  }

  Map<String, dynamic> header = Map();

  ///添加header
  BaseRequest addHeader(String key, Object value) {
    params[key] = value.toString();
    return this;
  }
}
