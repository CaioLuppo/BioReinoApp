import 'package:bioreino_mobile/controller/screens/screen_navigator/pages_enum.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/updatable_drawer_mixin.dart';
import 'package:flutter/material.dart';

void drawerOnTap(
    UpdatableDrawer updatableDrawer, Pages page, BuildContext context) {
  updatableDrawer.updatePage(page);
  Navigator.pop(context);
}
