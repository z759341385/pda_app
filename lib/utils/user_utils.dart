import 'package:flutter_demo_example/utils/event_bus.dart';
import 'package:flutter_demo_example/utils/share_prefrences_util.dart';

class UserUtil {
  static UserUtil? _singleton;
  static Future<UserUtil?> getInstance() async {
    if (_singleton == null) {
      var singleton = UserUtil._();
      await singleton._init();
      _singleton = singleton;
    }
    return _singleton;
  }

  UserUtil._();
  static String get userId => SpUtil.getString('UserId');
  static bool get loginStatus => SpUtil.getString('UserId').length == 0 ? false : true;

  Future _init() async {}

  static void logSuccessFun(String id) {
    SpUtil.putString('UserId', id);
    EventBusUtil.eventBus.fire(LogInStatusEvent(true, true));
  }
  static void logOutFun(String id) {
    SpUtil.putString('UserId', '');
    EventBusUtil.eventBus.fire(LogInStatusEvent(true, false));
  }
}
