import 'package:flutter_demo_example/http/request/base_request.dart';

class TestRequest extends BaseRequest{
  @override
  HttpMethod httpMethod() {
    // TODO: implement httpMethod
    throw UnimplementedError();
  }

  @override
  String path() {
    // TODO: implement path
    throw UnimplementedError();
  }

  @override
  bool needLogin() {
    // TODO: implement needLogin
   return false;
  }


}