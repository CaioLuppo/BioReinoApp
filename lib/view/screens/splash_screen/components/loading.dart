import 'package:bioreino_mobile/controller/util/theme_util.dart';
import 'package:bioreino_mobile/view/screens/splash_screen/splash_screen.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isThemeLight(context)
            ? bioreinoSimple
            : ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                child: bioreinoSimple,
              ),
        const SizedBox(height: 32),
        const LoadingBar()
      ],
    );
  }
}

class LoadingBar extends StatelessWidget {
  const LoadingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: LinearProgressIndicator(
          backgroundColor: Colors.white12,
          color: BRColors.greyText,
        ),
      ),
    );
  }
}
