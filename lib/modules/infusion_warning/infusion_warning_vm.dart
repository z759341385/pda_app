import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_example/components/ComDialog.dart';
import 'package:flutter_demo_example/utils/event_bus.dart';
import 'package:flutter_demo_example/utils/global.dart';
import 'package:vibration/vibration.dart';

class InfusionWarningVM extends ChangeNotifier {
  bool animatedPlay = false;
  List records =[1,2,3,4];

  playAnimate()async{
    animatedPlay = true;
    notifyListeners();
    if (await Vibration.hasVibrator() ?? false) {
    Vibration.vibrate();
    }
  }
  confirmInfo(){
    ComDialog.showTipDialog(
        title: '提示',
        content: '确定已处理该消息？',
        rightText: '确定',
        leftText: '取消',
        onlyRight: false,
        okCallBack: () {
          Navigator.pop(Global.navigatorKey.currentContext!);
        });
  }

  ///跳转登录页
  goLoginPage() {
    EventBusUtil.eventBus.fire(HomeBarIndexChanged(true, 2));
  }
}
