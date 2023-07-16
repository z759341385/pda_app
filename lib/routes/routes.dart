import 'package:flutter_demo_example/modules/bed_bind/bind/bind_page.dart';
import 'package:flutter_demo_example/modules/bed_bind/list/list_page.dart';
import 'package:flutter_demo_example/modules/home/home_page.dart';
import 'package:flutter_demo_example/modules/scan/scan_page.dart';
import 'package:flutter_demo_example/modules/test/api/api_test_page.dart';
import 'package:flutter_demo_example/modules/test/sp/sp_test_page.dart';

final appRoutes = {
  '/': (context, {arguments}) => MyHomePage(),
  '/test/sp': (context, {arguments}) => SpTestPage(
        arguments: arguments,
      ),
  '/test/api': (context, {arguments}) => ApiTestPage(
        arguments: arguments,
      ),
  '/bed_bind/list': (context, {arguments}) => BedBindListPage(
        arguments: arguments,
      ),
  '/bed_bind/scan': (context, {arguments}) => ScanPage(arguments: arguments),
  '/bed_bind/device': (context, {arguments}) => BindPage(arguments: arguments),
};
