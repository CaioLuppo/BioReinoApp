library screen_navigator;

import 'package:bioreino_mobile/controller/screens/screen_navigator/connection.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/pages_enum.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/updatable_drawer_mixin.dart';
import 'package:bioreino_mobile/view/global_components/assets/brassets.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/components/drawer/drawer.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/pages/account/account_page.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/pages/courses/courses_page.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/pages/home/home_page.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'components/app_bar.dart';
part 'components/base_screen.dart';
part 'components/drawer/components/back_button.dart';
part 'components/drawer/components/hamburguer_menu.dart';

class ScreenNavigator extends StatefulWidget {
  const ScreenNavigator({super.key});

  @override
  State<ScreenNavigator> createState() => ScreenNavigatorState();
}

class ScreenNavigatorState extends State<ScreenNavigator> with UpdatableDrawer {
  Pages page = Pages.home;
  bool showBackButton = false;

  @override
  void initState() {
    super.initState();
    ConnectionChecker(context).setConnectionListener();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pagesList = [
      HomePage(this),
      CoursesPage(this, showBackButton: showBackButton),
      AccountPage(this),
    ];
    return pagesList[page.index];
  }

  @override
  void updatePage(
    page, {
    bool showBackButton = false,
    String categoryName = "",
  }) {
    setState(() {
      this.showBackButton = showBackButton;
      this.page = page;
      CoursesPage.categoryName = categoryName;
    });
  }
}
