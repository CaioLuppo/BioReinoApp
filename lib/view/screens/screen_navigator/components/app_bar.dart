import 'package:bioreino_mobile/view/global_components/assets/brassets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final AppBar appBar = AppBar(
  toolbarHeight: 86,
  elevation: 0,
  centerTitle: true,
  title: Padding(
    padding: const EdgeInsets.only(left: 0.0),
    child: SvgPicture.asset(
      BRAssets.bioreinoExtense,
      height: 42,
    ),
  ),
);
