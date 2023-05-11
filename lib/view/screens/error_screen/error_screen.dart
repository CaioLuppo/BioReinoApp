import 'package:flutter/material.dart';

import 'package:bioreino_mobile/controller/screens/error_screen/error_screen_controller.dart';
import 'package:bioreino_mobile/controller/util/theme_util.dart';
import 'package:bioreino_mobile/view/screens/error_screen/components/try_again_button.dart';
import 'package:bioreino_mobile/view/screens/splash_screen/components/loading.dart';

class ConnectionErrorScreen extends StatefulWidget {
  const ConnectionErrorScreen({super.key});
  static bool buttonJustPressed = false;
  @override
  State<ConnectionErrorScreen> createState() => _ConnectionErrorScreenState();
}

class _ConnectionErrorScreenState extends State<ConnectionErrorScreen> {
  final errorTitleText = "Houve um erro!";
  final errorBodyText =
      "Verifique se está conectado à internet, e tente novamente!";
  final buttonText = "TENTAR NOVAMENTE";
  final Image errorImage = Image.asset(
    "assets/error_images/unknown_error.png",
    width: 300,
  );

  @override
  void initState() {
    super.initState();
    setButtonJustPressed(false);
  }

  @override
  Widget build(BuildContext context) {
    retryConnectionIfCan(
      context,
      () => setState(
        () => setButtonJustPressed(false),
      ),
    );

    Widget bottomWidget = TryAgainButton(
      buttonText,
      () => setState(
        () => setButtonJustPressed(),
      ),
    );

    if (ConnectionErrorScreen.buttonJustPressed) {
      bottomWidget = const LoadingBar();
    }

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible( // Image
              fit: FlexFit.loose,
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0, top: 8),
                child: errorImage,
              ),
            ),
            Flexible( // Title
              flex: 2,
              child: Text(
                errorTitleText,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: fromBrightnessColor(
                        context,
                        Colors.black,
                        Colors.white,
                      ),
                    ),
              ),
            ),
            Flexible( // Body
              flex: 2,
              child: Text(
                errorBodyText,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Flexible( // Bottom Widget (Loading or Button)
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: bottomWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
