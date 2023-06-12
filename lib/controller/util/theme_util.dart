import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

Color fromBrightnessColor(
    BuildContext context, Color lightColor, Color darkColor) {
  return isThemeLight(context) ? lightColor : darkColor;
}

bool isThemeLight(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}

MaterialStateColor mStateColor(Color color) {
  return MaterialStateColor.resolveWith(
    (_) => color,
  );
}

void handleUIStyle() {
  final window = SchedulerBinding.instance.platformDispatcher;
  _setUIStyle(window);
  window.onPlatformBrightnessChanged = () {
    _setUIStyle(window);
  };
}

void _setUIStyle(PlatformDispatcher window) {
  final brightness = window.platformBrightness;
  SystemChrome.setSystemUIOverlayStyle(
    brightness == Brightness.dark
        ? BRTheme.uiOverlayStyleDark
        : BRTheme.uiOverlayStyleLight,
  );
}
