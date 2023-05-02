import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:flutter/material.dart';

void drawerOnTap(DrawerNavigator drawerNavigator, Pages page,
    BuildContext context) {
  drawerNavigator.updatePage(page);
  Navigator.pop(context);
}
