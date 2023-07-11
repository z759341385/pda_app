import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_example/app/app_config.dart';
import 'package:flutter_demo_example/modules/my_app.dart';

void main() {
  runApp(AppConfig(
    config: AppConfigModel(
      envString: 'dev',
      baseUrl: 'http://web.juhe.cn:8080'
    ),
    child: MyApp(),
  ));
}
