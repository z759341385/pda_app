import 'package:flutter/material.dart';
import 'package:flutter_demo_example/components/ComAppBar.dart';
import 'package:flutter_demo_example/modules/component/button/common_action_button.dart';
import 'package:flutter_demo_example/modules/test/sp/sp_test_vm.dart';
import 'package:provider/provider.dart';

class SpTestPage extends StatefulWidget {
  final arguments;

  SpTestPage({Key? key, this.arguments}) : super(key: key);
  @override
  _SpTestPageState createState() => _SpTestPageState();
}

class _SpTestPageState extends State<SpTestPage> {
  TextEditingController _textEditingController = TextEditingController();
  SpTestVM _vm = SpTestVM();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<SpTestVM>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: ComAppBar.title(
              title: widget.arguments['title'],
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
          TextField(controller: _textEditingController, decoration: InputDecoration(hintText: '请输入')),
          CommonActionButton(
            onTap: () => _vm.setValue(_textEditingController.text),
            text: '存储',
          ),
          CommonActionButton(
            onTap: () => _vm.getValue(),
            text: '取值',
          ),
          Text(
            _vm.valueString,
          )
        ],
      ),
    );
  }
}
