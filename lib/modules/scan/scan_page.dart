
import 'package:flutter/material.dart';
import 'package:flutter_demo_example/modules/scan/scan_image_view.dart';
import 'package:flutter_demo_example/modules/scan/scan_vm.dart';
import 'package:flutter_demo_example/styles/lables.dart';
import 'package:provider/provider.dart';
import 'package:r_scan/r_scan.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key,required this.arguments}) : super(key: key);

  final Map arguments;

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final ScanVM _vm = ScanVM();


  @override
  void initState() {
    _vm.initCamera(widget.arguments);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ScanVM>(builder: (ctx,vm,child){
        return Scaffold(
          body: _buildBody(context),
        );
      }),
    );
  }



  Widget _buildBody(BuildContext context){
    if (_vm.rScanCameras.isEmpty) {
      return Container(
        width:double.infinity ,
        height:double.infinity ,
        color: Colors.black,
      );
    }
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Stack(
        children: [
          ScanImageView(
            child: RScanCamera(_vm.controller),
          ),
          _scanImage(),
          _textAndLight(context),
        ],
      ),
    );
  }


  Widget _textAndLight(BuildContext context){
    double scanHeight = MediaQuery.of(context).size.height*0.5+ MediaQuery.of(context).padding.top+60+40+24;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: scanHeight,
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              '将二维码放入屏幕内即可自动扫描',
              style: white14Style,
            ),
            const SizedBox(
              height: 36,
            ),
            GestureDetector(
              child: Container(
                  color:Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/icon/scanLight.png',
                        width: 28,
                        color: Colors.white.withOpacity(_vm.isFront?1:0.5),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        _vm.isFront?'轻点关闭':'轻点照亮',
                        style: white14Style,
                      )
                    ],
                  )
              ),
              onTap:_vm.switchLight,
            ),
          ],
        ),
      ),
    );
  }

  Widget _scanImage(){
    return Positioned(
      right: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              onTap: _vm.pop,
            ),
            GestureDetector(
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '相册',
                      style: white14Style,
                    )
                  ],
                ),
              ),
              onTap:_vm.scanImage,
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _vm.controller.dispose();
    super.dispose();

  }

}
