import 'package:bioreino_mobile/controller/screens/screen_navigator/connection.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/pages_enum.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/updatable_drawer_mixin.dart';
import 'package:bioreino_mobile/view/screens/pages/home/home.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/components/Drawer.dart';
import 'package:flutter/material.dart';

import 'components/app_bar.dart';

class ScreenNavigator extends StatefulWidget {
  const ScreenNavigator({super.key});

  @override
  State<ScreenNavigator> createState() => _ScreenNavigatorState();
}

class _ScreenNavigatorState extends State<ScreenNavigator>
    with UpdatableDrawer {
  // Page stuff
  final List pagesList = [const HomePage(), const Text("ola mundo")];
  Pages page = Pages.home;

  @override
  void initState() {
    super.initState();
    verifyConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: BRDrawer(context, this),
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
