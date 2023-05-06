import 'dart:async';
import 'dart:ui';

import 'package:bioreino_mobile/view/screens/pages/home/home.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/components/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/app_bar.dart';

class ScreenNavigator extends StatefulWidget {
  const ScreenNavigator({super.key});

  @override
  State<ScreenNavigator> createState() => _ScreenNavigatorState();
}

class _ScreenNavigatorState extends State<ScreenNavigator>
    with DrawerNavigator {
  final List pagesList = [const HomePage(), const Text("ola mundo")];

  Pages page = Pages.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: BRDrawer(context, this),
      body: pagesList[page.index],
    );
  }

  @override
  void updatePage(Pages page) {
    setState(() {
      this.page = page;
    });
  }
}

mixin DrawerNavigator on State<ScreenNavigator> {
  void updatePage(Pages page);
}

enum Pages {
  home,
  // lessons,
  // courses,
  // categories,
  account,
}
