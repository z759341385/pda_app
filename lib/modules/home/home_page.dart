import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_example/modules/component/button/common_action_button.dart';
import 'package:provider/provider.dart';

import 'home_page_vm.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  HomePageVM _vm = HomePageVM();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<HomePageVM>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title!),
            ),
            body: _buildBody(),
            floatingActionButton: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CommonActionButton(
              onTap: () => Navigator.pushNamed(context, '/test/api', arguments: {'title': 'api'}),
              text: 'api请求测试页',
            ),
            CommonActionButton(
              onTap: () {
                Navigator.pushNamed(context, '/test/sp', arguments: {'title': 'sp'});
              },
              text: 'sp测试页',
            ),
            CommonActionButton(
              onTap: () {
                Navigator.pushNamed(context, '/bed_bind/list', arguments: {'title': 'sp'});
              },
              text: '床位绑定列表页',
            ),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
