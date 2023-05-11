import 'package:flutter/material.dart';

Color fromBrightnessColor(
    BuildContext context, Color lightColor, Color darkColor) {
  return isThemeLight(context) ? lightColor : darkColor;
}

bool isThemeLight(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}