import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_example/routes/routes.dart';

class AppRouteManager {
  //单例
  static AppRouteManager? _instance;

  AppRouteManager._();

  static AppRouteManager? getInstance() {
    if (_instance == null) {
      _instance = AppRouteManager._();
    }
    return _instance;
  }

  ///统一跳转处理
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final Function? pageBuilder = appRoutes[name!];
    if (pageBuilder != null) {
      final Route route = CupertinoPageRoute(
          settings: settings,
          builder: (context) {
            return pageBuilder(context, arguments: settings.arguments);
          });
      return route;
    } else {
      ///找不到路由
      ///重定向
      Function? pageBuilder = appRoutes['/common/not_found'];
      final Route route = CupertinoPageRoute(
          settings: settings,
          builder: (context) {
            return pageBuilder!(context, arguments: name);
          });
      return route;
    }
  }
}