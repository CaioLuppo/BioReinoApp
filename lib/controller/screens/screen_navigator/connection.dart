import 'dart:async';

import 'package:bioreino_mobile/controller/screens/splash_screen/route_animation.dart';
import 'package:bioreino_mobile/view/screens/connection_error_screen/connection_error_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



late StreamSubscription connectionListener;
bool deviceIsConnected = false;

void verifyConnection(BuildContext context) {
  connectionListener = Connectivity().onConnectivityChanged.listen(
    (_) async {
      deviceIsConnected = await InternetConnectionChecker().hasConnection;
      if (!deviceIsConnected && context.mounted) {
        changeScreen(context, const ConnectionErrorScreen());
      }
    },
  );
}
