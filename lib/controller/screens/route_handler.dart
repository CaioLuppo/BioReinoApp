import 'package:bioreino_mobile/controller/database/mongodb_database.dart';
import 'package:bioreino_mobile/controller/screens/login_screen/login_controller.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/pages_enum.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/updatable_drawer_mixin.dart';
import 'package:bioreino_mobile/view/screens/connection_error_screen/connection_error_screen.dart';
import 'package:bioreino_mobile/view/screens/login_screen/login_screen.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> connectAndChangeScreen(BuildContext context) async {
  final bool connected = await Database.connect();
  if (context.mounted) {
    if (connected) {
      // ignore: use_build_context_synchronously
      if (await checkStudentAlreadyLogged(context)) {
        if (context.mounted) changeScreen(context, const ScreenNavigator());
      } else if (context.mounted) {
        changeScreen(context, const LoginScreen());
      }
    } else {
      changeScreen(context, const ConnectionErrorScreen());
    }
  }
}

Future<dynamic> changeScreen(
  BuildContext context,
  Widget page, {
  bool leftToRight = false,
  bool dontReplace = false,
}) {
  return dontReplace
      ? Navigator.push(context, _animatedRoute(page, leftToRight))
      : Navigator.pushReplacement(context, _animatedRoute(page, leftToRight));
}

PageRouteBuilder _animatedRoute(Widget page, bool leftToRight) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin =
          leftToRight ? const Offset(-1.0, 00) : const Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Future<bool> exitPage(bool showBackButton, UpdatableDrawer drawer) {
  if (showBackButton) {
    drawer.updatePage(Pages.home);
    return true as Future<bool>;
  }
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  return true as Future<bool>;
}
