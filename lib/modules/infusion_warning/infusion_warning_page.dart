import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_example/components/ComAppBar.dart';
import 'package:flutter_demo_example/components/ComContainerFlash.dart';
import 'package:flutter_demo_example/modules/component/button/common_action_button.dart';
import 'package:flutter_demo_example/styles/colours.dart';
import 'package:flutter_demo_example/styles/lables.dart';
import 'package:flutter_demo_example/utils/user_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'infusion_warning_vm.dart';

class InfusionWarningPage extends StatefulWidget {
  InfusionWarningPage({Key? key}) : super(key: key);

  @override
  State<InfusionWarningPage> createState() => _InfusionWarningPageState();
}

class _InfusionWarningPageState extends State<InfusionWarningPage> {
  InfusionWarningVM _vm = InfusionWarningVM();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<InfusionWarningVM>(
        builder: (context, vm, child) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: ComAppBar.title(
                title: '输液监控',
                hasBackView: false,
              ),
              body: UserUtil.loginStatus ? _buildBody() : _buildUnlogBody(),
            ),
          );
        },
      ),
    );
  }

  _buildBody() {
    return _vm.records.length == 0
        ? Center(
            child: Text('暂无数据'),
          )
        : ListView.builder(
            itemCount: _vm.records.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 12.w),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                width: 1.sw,
                child: ContainerFlash(
                  play: _vm.animatedPlay,
                  speed: 0.2,
                  duration: 15000, //持续时长
                  flashColor: Color(0xFFD9471A).withOpacity(0.3), //闪烁颜色
                  initColor: Colors.white,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${_vm.records[index]}号床输液即将结束'),
                        Container(
                          height: 30.w,
                          width: 60.w,
                          child: CommonActionButton(
                            onTap: () => _vm.playAnimate(),
                            // onTap: () => _vm.confirmInfo(),
                            text: '确认',
                            textStyle: white12Style,
                            backgroundColor: Colours.activeGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
  }

  _buildUnlogBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(alignment: Alignment.center, child: Text('您还未登录!')),
        SizedBox(
          height: 40.w,
        ),
        Container(
          height: 40.w,
          width: 0.4.sw,
          child: CommonActionButton(
            onTap: () => _vm.goLoginPage(),
            text: '去登录',
          ),
        ),
      ],
    );
  }
}
