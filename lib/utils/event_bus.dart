import 'package:event_bus/event_bus.dart';

class EventBusUtil {
  static EventBusUtil? _singleton;

  static late EventBus eventBus;

  static Future<EventBusUtil?> getInstance() async {
    if (_singleton == null) {
      var singleton = EventBusUtil._();
      await singleton._init();
      _singleton = singleton;
    }
    return _singleton;
  }

  EventBusUtil._();

  Future _init() async {
    eventBus = EventBus();
  }
}

//登录状态改变
class LogInStatusEvent {
  bool loginStatusChanged;
  bool login;
  LogInStatusEvent(this.loginStatusChanged, this.login);
}

//用户信息改变
class UserInfoChangedEvent {
  bool userInfoChanged;
  UserInfoChangedEvent(this.userInfoChanged);
}

//首页tabbr下标切换
class HomeBarIndexChanged {
  bool changed;
  int index;
  HomeBarIndexChanged(this.changed, this.index);
}
