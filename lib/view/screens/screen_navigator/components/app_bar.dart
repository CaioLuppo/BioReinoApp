import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final AppBar appBar = AppBar(
  toolbarHeight: 86,
  elevation: 0,
  title: Center(
    widthFactor: 1.6,
    child: SvgPicture.asset(
      "assets/bioreino_logo.svg",
      height: 42,
    ),
  ),
);
