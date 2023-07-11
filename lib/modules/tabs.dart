import 'package:flutter/material.dart';

import 'home/home_page.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        IndexedStack(
          children: [
            MyHomePage(),
          ],
        ),
      ]),
    );
  }
}
