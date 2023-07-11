import 'package:flutter/cupertino.dart';

class AppConfig extends InheritedWidget {
  static AppConfig? _instance;

  static AppConfig? get instance => _instance;

  final Widget child;
  final AppConfigModel config;

  AppConfig({
    required this.child,
    required this.config,
  }) : super(child: child) {
    _instance = this;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}

class AppConfigModel {
  String? _baseUrl;
  String? _envString;
  String? get baseUrl => _baseUrl;
  String? get envString => _envString;

  AppConfigModel(
      {String? baseUrl,
      String? envString,
      String? iosBundleId,
      String? weChatAppId,
      String? agreementBaseUrl,
      String? shareBaseUrl,
      String? downloadBaseUrl}) {
    _baseUrl = baseUrl;
    _envString = envString;
  }
}
