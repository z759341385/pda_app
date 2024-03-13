import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_example/api/bed.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

enum ViewMode { list, grid }

class BedBindListPage extends StatefulWidget {
  final arguments;

  const BedBindListPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<BedBindListPage> createState() => _BedBindListPageState();
}

class _BedBindListPageState extends State<BedBindListPage> {
  ViewMode curViewMode = ViewMode.grid;
  List deptList = [];
  List bedList = [];
  Map curDept = {};
  String devUid ='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     devUid = widget.arguments['devUid'];
  print(devUid);
    getDeptList();
  }

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
            bedList.length == 0
                ? Expanded(
                    child: Center(
                      child: Text('暂无数据'),
                    ),
                  )
                : curViewMode == ViewMode.grid
                    ? _buildGridContent()
                    : _buildListContent(),
          ],
        ));
  }

  _buildTitle() {
    List<DropdownMenuItem<dynamic>> items = [];
    deptList.forEach((element) {
      items.add(
        DropdownMenuItem<String>(
            value: element['id'], child: Text(element['name'] ?? '--')),
      );
    });
    return Row(
      children: [
        Text(
          '病区:',
          style: new TextStyle(
            fontSize: 20.0,
            color: const Color(0xFF202020),
          ),
        ),
        SizedBox(width: 30),
        Expanded(
            child: items.length > 0 && curDept.isNotEmpty
                ? DropdownButton<dynamic>(
                    onChanged: (res) => popupButtonSelected(res),
                    value: curDept['id'] ?? "--",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF202020),
                    ),
                    items: items,
                    isExpanded: true,
                  )
                : Container())
      ],
    );
  }

  _buildGridContent() {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        height: 100,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 80,
              childAspectRatio: 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
          itemCount: bedList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                if(bedList[index]['devBindFlag'] == '1'){
                  EasyLoading.showError('该床位已绑定！');
                  return;
                }
                goBind(bedList[index]['bedId']);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: bedList[index]['devBindFlag'] == '1'
                            ? Colors.green
                            : Colors.grey.shade300,
                        width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  bedList[index]['bedNo'],
                  style: new TextStyle(
                      fontSize: 16.0,
                      color: bedList[index]['devBindFlag'] == '1'
                          ? Colors.green
                          : Colors.grey[500],
                      fontWeight: FontWeight.w800),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _buildListContent() {
    return Expanded(
        child: ListView.builder(
            itemCount: bedList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  if(bedList[index]['devBindFlag'] == '1'){
                    EasyLoading.showError('该床位已绑定！');
                    return;
                  }
                  goBind(bedList[index]['bedId']);
                },
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(bedList[index]['bedNo']),
                          Expanded(child: Text(bedList[index]['devUid'],textAlign: TextAlign.end,)),
                        ],
                      )),
                ),
              );
            }));
  }

  void popupButtonSelected(value) {
    print(value);
    var dept = deptList.firstWhere((i) => i['id'] == value);
    curDept = dept;
    setState(() {});
    getBedList();
  }

  void buttonPressed() {
    if (curViewMode == ViewMode.grid) {
      curViewMode = ViewMode.list;
    } else {
      curViewMode = ViewMode.grid;
    }
    setState(() {});
  }

  getDeptList() async {
    await BedApi().getDeptList().then((value) {
      deptList = value['data'];
      curDept = deptList[0];
      setState(() {});
      getBedList();
    });
  }

  getBedList() async {
    await BedApi().getBedList(curDept['id']).then((value) {
      print(value);
      bedList = value['data'] ?? [];
      setState(() {});
    });
  }
  goBind(bedId) async {
    var alertDialogs = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("确定要绑定该床位吗？"),
            actions: <Widget>[
              TextButton(onPressed: () {
                Navigator.pop(context, "Cancel");
              },
                  child: const Text("取消")),
              TextButton(onPressed: () async{
                Navigator.pop(context);
                await BedApi().bindDevice(devUid,bedId).then((value) {
                  print(value);
                  if(value['ret'] =='1'){
                    EasyLoading.showSuccess('绑定成功');
                    Navigator.pop(context);
                  }
                  setState(() {});
                });
              },
                  child: const Text("确定")),
            ],
          );
        });
    return alertDialogs;
  }
}
