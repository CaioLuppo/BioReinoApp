import 'package:bioreino_mobile/controller/util/theme_util.dart';
import 'package:bioreino_mobile/view/screens/splash_screen/splash_screen.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';

class AraradevsIcon extends StatelessWidget {
  const AraradevsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        fromBrightnessColor(context, BRColors.blackDark, BRColors.greyText),
        BlendMode.srcIn,
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: araradevsIcon,
      ),
    );
  }
}
