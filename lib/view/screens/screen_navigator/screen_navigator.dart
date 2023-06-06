library screen_navigator;

import 'package:bioreino_mobile/controller/screens/screen_navigator/connection.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/pages_enum.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/updatable_drawer_mixin.dart';
import 'package:bioreino_mobile/view/global_components/assets/brassets.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/components/drawer/drawer.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'components/app_bar.dart';

class ScreenNavigator extends StatefulWidget {
  const ScreenNavigator({super.key});

  @override
  State<ScreenNavigator> createState() => _ScreenNavigatorState();
}

class _ScreenNavigatorState extends State<ScreenNavigator>
    with UpdatableDrawer {
  final List pagesList = [const HomePage(), const Text("ola mundo")];
  Pages page = Pages.home;

  @override
  void initState() {
    super.initState();
    ConnectionChecker(context).setConnectionListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawerEnableOpenDragGesture: false,
      drawer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BRDrawer(context, this),
      ),
      body: pagesList[page.index],
    );
  }

  @override
  void updatePage(page) {
    setState(() {
      this.page = page;
    });
  }
}
