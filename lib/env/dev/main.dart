import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_example/app/app_config.dart';
import 'package:flutter_demo_example/modules/my_app.dart';

void main() {
  runApp(AppConfig(
    config: AppConfigModel(
      envString: 'dev',
        baseUrl: 'http://212.129.241.31:8889'
    ),
    child: MyApp(),
  ));
}
