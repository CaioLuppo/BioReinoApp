library br_themes;

import 'package:bioreino_mobile/controller/util/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

part 'br_colors.dart';
part 'text_themes.dart';
part 'button_styles.dart';

abstract class BRTheme {

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      color: BRColors.blackDark,
    ),
    scaffoldBackgroundColor: BRColors.blackDark,
    cardColor: BRColors.cardDark,
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: textTheme,
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
      color: Colors.grey[50],
      foregroundColor: BRColors.greyText,
    ),
    cardColor: Colors.white,
  );

  static final SystemUiOverlayStyle uiOverlayStyleDark = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: BRColors.blackDark,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static final SystemUiOverlayStyle uiOverlayStyleLight = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.grey[50],
    systemNavigationBarIconBrightness: Brightness.dark,
  );

}
