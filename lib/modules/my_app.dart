import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_example/app/app_config.dart';
import 'package:flutter_demo_example/modules/bed_bind/bind/bind_page.dart';
import 'package:flutter_demo_example/modules/tabs.dart';
import 'package:flutter_demo_example/routes/route_handler.dart';
import 'package:flutter_demo_example/utils/event_bus.dart';
import 'package:flutter_demo_example/utils/global.dart';
import 'package:flutter_demo_example/utils/share_prefrences_util.dart';
import 'package:flutter_demo_example/utils/user_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home/home_page.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpUtil.getInstance();
    EventBusUtil.getInstance();
    UserUtil.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        //screenUtil design size init
        // designSize: Size(360, 690),
        builder: () => MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: AppRouteManager.getInstance()!.onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Tabs(),
      builder: EasyLoading.init(),
      navigatorKey: Global.navigatorKey,
        ),
    );
  }
}
