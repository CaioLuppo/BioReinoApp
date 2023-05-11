import 'package:bioreino_mobile/controller/screens/screen_navigator/pages_enum.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:flutter/material.dart';

mixin UpdatableDrawer on State<ScreenNavigator> {
  void updatePage(Pages page);
}
