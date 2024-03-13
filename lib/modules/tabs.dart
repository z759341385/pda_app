import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_example/app/app_config.dart';
import 'package:flutter_demo_example/modules/test/api/api_test_page.dart';
import 'package:flutter_demo_example/modules/test/sp/sp_test_page.dart';
import 'package:flutter_demo_example/styles/colours.dart';
import 'package:flutter_demo_example/utils/event_bus.dart';

import 'bed_bind/bind/bind_page.dart';
import 'home/home_page.dart';
import 'infusion_warning/infusion_warning_page.dart';
import 'mine/mine_page.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> with TickerProviderStateMixin {
  final iconList = <IconData>[
    Icons.ad_units_outlined,
    Icons.add_box_outlined,
    Icons.account_circle_outlined,
  ];
  final titleList = <String>[
    '输液预警',
    '床位绑定',
    '我的',
  ];

  final autoSizeGroup = AutoSizeGroup();
  int index = 0;
  @override
  void initState() {
    super.initState();
    EventBusUtil.eventBus.on<HomeBarIndexChanged>().listen((event) {
      if (event.changed) {
        index = event.index;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        IndexedStack(
          index: index,
          children: [
            InfusionWarningPage(),
            BindPage(
              arguments: {},
            ),
            MinePage(),
          ],
        ),
      ]),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        onTap: (int) {
          index = int;
          setState(() {});
        },
        activeIndex: index,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colours.title : Colors.grey[400];
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  titleList[index],
                  maxLines: 1,
                  style: TextStyle(color: color),
                  group: autoSizeGroup,
                ),
              )
            ],
          );
        },
        itemCount: 3,
        splashSpeedInMilliseconds: 0,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.none,
        leftCornerRadius: 0,
        rightCornerRadius: 0,

        //other params
      ),
    );
  }
}
