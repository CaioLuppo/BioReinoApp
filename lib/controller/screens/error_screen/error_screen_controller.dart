import 'package:bioreino_mobile/controller/database/mongodb_database.dart';
import 'package:bioreino_mobile/controller/screens/route_handler.dart';
import 'package:bioreino_mobile/view/screens/connection_error_screen/connection_error_screen.dart';
import 'package:bioreino_mobile/view/screens/splash_screen/splash_screen.dart';
import 'package:flutter/widgets.dart';

void setButtonJustPressed([bool buttonPressed = true]) {
  ConnectionErrorScreen.buttonJustPressed = buttonPressed;
}

retryConnectionIfCan(BuildContext context, Function onError) async {
  if (ConnectionErrorScreen.buttonJustPressed) {
    await Future.delayed(const Duration(seconds: 1));
    await Database.connect().then((connected) {
      connected
          ? changeScreen(
              context,
              const SplashScreen(
                lostedConnection: true,
              ),
            )
          : onError();
    });
  }
}
