import 'package:flutter/material.dart';
import 'package:flutter_demo_example/api/bed.dart';
import 'package:flutter_demo_example/utils/global.dart';
import 'package:flutter_demo_example/utils/toast_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:r_scan/r_scan.dart';
class BindVM extends ChangeNotifier{
  late final TextEditingController deviceInput = TextEditingController();
  late int _deviceStatus = -1;
  int get deviceStatus => _deviceStatus;
  late String _bindBed = "";
  String get bindBed => _bindBed;
  late String _statusString = "未扫描";
  String get statusString => _statusString;
  late bool _showClear = false;
  bool get showClear => _showClear;
  late final inputNode = FocusNode();
  late String _deviceId = "";
  String get deviceId => _deviceId;

  //查询设备状态
  searchStatus(){
    String id =deviceInput.text;
    if(id.trim().isEmpty){
      ToastUtils.showToastCenter('请输入设备码');
      return;
    }
    _deviceId = id;
    BedApi().getDeviceStatus(id).then((value) => {
      if(value['ret']== "1"){
        deviceDeal(value['data'][0])
      }else{
        deviceDealFail()
      }


    });
  }
  //设备处理
  deviceDeal(value){
    _deviceStatus = int.parse(value['bindFlag'].toString());
   if(_deviceStatus == 1){
     _bindBed = value['bindBedNo'];
   }
    _statusString = _deviceStatus == 1?'已绑定${value['bindDepName']}科室 ${_bindBed} 床位 ':'未绑定';
    notifyListeners();
  }
  //设备失败处理
  deviceDealFail(){
    _deviceStatus = -1;
    _statusString = "查询失败";
    notifyListeners();
  }

  //解绑
  unbindBed(String id,BuildContext context)async{
    var alertDialogs = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("确定要解绑该床位吗？"),
            actions: <Widget>[
              TextButton(onPressed: () {
                Navigator.pop(context, "Cancel");
              },
                  child: const Text("取消")),
              TextButton(onPressed: () async{
                Navigator.pop(context);
                var res = await BedApi().unbindDevice(_deviceId);
                if(res['ret'] == "1"){
                  _deviceStatus = 0;
                  _statusString = "未绑定";
                }else{
                  ToastUtils.showToastCenter("解绑失败");
                }
                notifyListeners();
              },
                  child: const Text("确定")),
            ],
          );
        });
    return alertDialogs;

  }
  //更新clear
  updateCLear(){
    if(_showClear){
      _showClear = false;
      deviceInput.text = "";
    }else{
      _showClear = true;
    }
    notifyListeners();
  }
  //关闭焦点


  //跳转绑定
  jumpBind(){
    Navigator.pushNamed(Global.navigatorKey.currentContext!, '/bed_bind/list', arguments: {'title': 'sp','devUid':deviceId}).then((value) => {
      searchStatus()
    });
  }

  //跳转扫一扫
  jumpScan() async {
    var status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      ToastUtils.showToastCenter("请授予相机权限");
      return;
    }
    List<RScanCameraDescription> _rScanCameras = await availableRScanCameras();
    if (_rScanCameras.isNotEmpty){
      Navigator.pushNamed(Global.navigatorKey.currentContext!, '/bed_bind/scan',arguments: {'cameras':_rScanCameras}).then((value) => {
        if(value != null)sendValue(value)
      });
    }else{
      ToastUtils.showToastCenter("暂无可用设备");
    }
  }
  //传值
  sendValue(data){
    deviceInput.text = data.toString();
    notifyListeners();
  }
  //清空焦点
  clearFocus(){
    inputNode.unfocus();
  }

}