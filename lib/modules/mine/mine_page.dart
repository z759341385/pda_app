import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_example/components/ComAppBar.dart';
import 'package:flutter_demo_example/modules/component/button/common_action_button.dart';
import 'package:flutter_demo_example/styles/lables.dart';
import 'package:flutter_demo_example/utils/user_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'mine_page_vm.dart';

class MinePage extends StatefulWidget {
  MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  MinePageVM _vm = MinePageVM();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<MinePageVM>(
        builder: (context, vm, child) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: ComAppBar.title(
                title: UserUtil.loginStatus ? '我的' : '我的',
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
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              '您好！XXX',
              style: black20Style,
            ),
          ),
          Container(
            height: 40.w,
            width: 0.8.sw,
            child: CommonActionButton(
              onTap: () => _vm.logout(),
              backgroundColor: Colors.redAccent,
              text: '退出登录',
            ),
          ),
        ],
      ),
    );
  }

  _buildUnlogBody() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            controller: _vm.textEditingController,
            decoration: InputDecoration(hintText: '请输入工号'),
          ),
          Container(
            height: 40.w,
            width: 0.8.sw,
            child: CommonActionButton(
              onTap: () => _vm.login(),
              text: '登录',
            ),
          ),
        ],
      ),
    );
  }
}
