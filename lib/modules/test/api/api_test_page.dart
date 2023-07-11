import 'package:flutter/material.dart';
import 'package:flutter_demo_example/modules/component/button/common_action_button.dart';
import 'package:provider/provider.dart';

import 'api_test_vm.dart';

class ApiTestPage extends StatefulWidget {
  final arguments;

  ApiTestPage({Key? key, this.arguments}) : super(key: key);
  @override
  _ApiTestPageState createState() => _ApiTestPageState();
}

class _ApiTestPageState extends State<ApiTestPage> {
  ApiTestVM _vm = ApiTestVM();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ApiTestVM>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.arguments['title']),
            ),
            body: _buildBody(),
          );
        },
      ),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonActionButton(
            onTap: () => _vm.sendRequest(),
            text: 'api请求',
          ),
          Text(
            _vm.data ?? '',
          )
        ],
      ),
    );
  }
}
