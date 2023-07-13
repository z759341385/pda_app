import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ViewMode { list, grid }

class BedBindListPage extends StatefulWidget {
  final arguments;

  const BedBindListPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<BedBindListPage> createState() => _BedBindListPageState();
}

class _BedBindListPageState extends State<BedBindListPage> {
  ViewMode curViewMode = ViewMode.grid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('床位绑定'),
        actions: [
          IconButton(
            key: null,
            onPressed: buttonPressed,
            color: const Color(0xFFe0e0e0),
            icon: Icon(curViewMode == ViewMode.grid
                ? Icons.list
                : Icons.view_comfortable_rounded),
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _buildTitle(),
            SizedBox(height: 20),
            curViewMode == ViewMode.grid  ? _buildGridContent():_buildListContent(),
          ],
        ));
  }

  _buildTitle() {
    return Row(
      children: [
        Text(
          '病区名',
          style: new TextStyle(
            fontSize: 22.0,
            color: const Color(0xFF202020),
          ),
        ),
        SizedBox(width: 30),
        Expanded(
          child: DropdownButton<String>(
            onChanged: (res) => popupButtonSelected,
            value: "Child 1",
            style: TextStyle(
              fontSize: 22.0,
              color: Color(0xFF202020),
            ),
            items: <DropdownMenuItem<String>>[
              const DropdownMenuItem<String>(
                  value: "Child 1", child: const Text("Child 1")),
              const DropdownMenuItem<String>(
                  value: "Child 2", child: const Text("Child 2")),
              const DropdownMenuItem<String>(
                  value: "Child 3", child: const Text("Child 3")),
            ],
            isExpanded: true,
          ),
        )
      ],
    );
  }

  _buildGridContent() {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        height: 100,
        child: GridView.extent(
            maxCrossAxisExtent: 80.0,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              new FlutterLogo(
                size: 10.0,
              ),
              new FlutterLogo(
                size: 10.0,
              ),
              new FlutterLogo(
                size: 10.0,
              ),
              new FlutterLogo(
                size: 10.0,
              ),
              new FlutterLogo(
                size: 10.0,
              ),
              new FlutterLogo(
                size: 10.0,
              ),
            ]),
      ),
    );
  }
  _buildListContent(){
  return Container();
  }

  void popupButtonSelected(String value) {}
  void buttonPressed() {
    if (curViewMode == ViewMode.grid) {
      curViewMode = ViewMode.list;
    } else {
      curViewMode = ViewMode.grid;
    }
    setState(() {});
  }
}
