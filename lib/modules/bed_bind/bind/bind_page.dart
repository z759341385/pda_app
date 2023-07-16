import 'package:flutter/material.dart';
import 'package:flutter_demo_example/modules/bed_bind/bind/bind_vm.dart';
import 'package:flutter_demo_example/styles/colours.dart';
import 'package:flutter_demo_example/styles/lables.dart';
import 'package:provider/provider.dart';

class BindPage extends StatefulWidget {
  const BindPage({Key? key, required this.arguments}) : super(key: key);

  final Map arguments;

  @override
  State<BindPage> createState() => _BindPageState();
}

class _BindPageState extends State<BindPage> {
  final BindVM _vm = BindVM();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<BindVM>(builder: (ctx, vm, child) {
        return GestureDetector(
          onTap:_vm.clearFocus,
          child: Scaffold(
            appBar: AppBar(
              title: Text('床位绑定'),
              elevation: 0,
              actions: [
                GestureDetector(
                  onTap: () {
                    _vm.clearFocus();
                    _vm.jumpScan();
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Image.asset(
                      'lib/assets/icon/scan.png',
                      width: 26,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            body: _buildBody(context),
          ),
        );
      }),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _inputArea(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 24),
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "当前状态: ${_vm.statusString}",
              textAlign: TextAlign.center,
              style: black16Style,
            ),
          ),
          _vm.deviceStatus == 0?_bindBtn(0):SizedBox(),
          _vm.deviceStatus == 1?_bindBtn(1):SizedBox(),
        ],
      ),
    );
  }

  Widget _inputArea() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [Expanded(child: _inputContent()), _finishBtn()],
      ),
    );
  }

  Widget _finishBtn() {
    return GestureDetector(
      onTap: () {
        _vm.clearFocus();
        _vm.searchStatus(_vm.deviceInput.text);
      },
      child: Container(
        width: 60,
        height: 40,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: Colours.theme,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '查询',
          style: white14Style,
        ),
      ),
    );
  }

  Widget _inputContent() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 8, left: 16),
            child: Text(
              '设备码：',
              style: black16Style,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _vm.deviceInput,
              // onSaved: (v) => _password = v!,
              textAlignVertical: TextAlignVertical.center,
              focusNode: _vm.inputNode,
              onChanged: (value){
                if(value.isNotEmpty&&!_vm.showClear || value.isEmpty&&_vm.showClear)_vm.updateCLear();
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                isDense: true,
                hintText: "请扫描/输入设备码",
                contentPadding:EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                border: InputBorder.none,
                suffixIcon: _vm.deviceInput.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          _vm.updateCLear();
                          // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                        },
                      )
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _bindBtn(int type){
    return GestureDetector(
      onTap: (){
        _vm.clearFocus();
        type == 0?_vm.jumpBind():_vm.unbindBed(_vm.deviceInput.text);
      },
      child: Container(
        width: double.infinity,
        height: 40,
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(16, 24, 16, 0),
        decoration: BoxDecoration(
          color: type == 0?Colours.theme:Colours.warningRed,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          type == 0?'绑定床位':'解绑',
          style: white14Style,
        ),
      ),
    );
  }
}
