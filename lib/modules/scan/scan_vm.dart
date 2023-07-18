





import 'package:flutter/material.dart';
import 'package:flutter_demo_example/styles/lables.dart';
import 'package:flutter_demo_example/utils/global.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:r_scan/r_scan.dart';
import 'package:scan/scan.dart';
class ScanVM extends ChangeNotifier{



  RScanCameraController get controller => _controller;

  late final RScanCameraController _controller;
  late List<RScanCameraDescription> _rScanCameras = [];
  List<RScanCameraDescription> get rScanCameras =>_rScanCameras;
  bool isFront = false;
  bool _isFirst = true;
  void initCamera(Map arguments) async {
    _rScanCameras = arguments['cameras'];
    if (_rScanCameras.isNotEmpty) {
      _controller = RScanCameraController(
          _rScanCameras[0], RScanCameraResolutionPreset.high)
        ..addListener(() {
          final result = _controller.result;
          debugPrint("-=-=-=-=-=$result");
          if(result ==null){
            return;
          }
          if(_isFirst){
            _isFirst = false;
            scanResult(result.message.toString());
            return;
          }

        })
        ..initialize().then((_) async{
          isFront = (await _controller.getFlashMode())??false;
          notifyListeners();
        });
    }
  }






  //扫描相册二维码
  scanImage()async{
    var status = await Permission.storage.request();
    if(status != PermissionStatus.granted){
      debugPrint('请检查系统权限');
      return;
    }
    var res = await ImagePicker().getImage(source: ImageSource.gallery);
    if (res != null) {
      String? str = await Scan.parse(res.path);
      scanResult(str);
    }
  }

  //扫描结果
  scanResult(String? data){
    debugPrint(data??"");
    Navigator.pop(Global.navigatorKey.currentContext!,data);
  }

  pop(){
    Navigator.pop(Global.navigatorKey.currentContext!);
  }

  //切换亮筒
  switchLight(){
    try{
      _controller.setFlashMode(!isFront);
      isFront = !isFront;
      notifyListeners();
    }catch(e){

    }
    // _controller.pause();
  }


  // _scanLogin(String data,BuildContext context)async{
  //   Map value  = json.decode(data)??{};
  //   if(value.keys.isEmpty){
  //     debugPrint('未扫描到有用信息');
  //     return;
  //   }
  //   debugPrint('$value------------------------------');
  // }
}