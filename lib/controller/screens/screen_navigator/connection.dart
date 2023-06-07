import 'dart:async';

import 'package:bioreino_mobile/controller/screens/route_handler.dart';
import 'package:bioreino_mobile/view/screens/connection_error_screen/connection_error_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionChecker {
  StreamSubscription? connectionListener;
  static BuildContext? actualContext;

  ConnectionChecker(BuildContext context) {
    ConnectionChecker.actualContext = context;
  }

  void setConnectionListener() {
    connectionListener ??= Connectivity().onConnectivityChanged.listen(
      (_) async {
        final bool deviceIsConnected =
            await InternetConnectionChecker().hasConnection;
        if (!deviceIsConnected && actualContext!.mounted) {
          changeScreen(actualContext!, const ConnectionErrorScreen());
        }
      },
    );
  }
}
