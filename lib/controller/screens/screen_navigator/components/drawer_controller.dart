import 'package:bioreino_mobile/controller/screens/screen_navigator/pages_enum.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/updatable_drawer_mixin.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/components/drawer/drawer.dart';
import 'package:flutter/material.dart';

void drawerOnTap(
  UpdatableDrawer updatableDrawer,
  Pages page,
  BuildContext context,
) {
  updatableDrawer.updatePage(page, showBackButton: false);
  Navigator.pop(context);
}

void showExitConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const LogoutDialog(),
    barrierDismissible: false,
  );
}
