import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';

class TryAgainButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;

  const TryAgainButton(this.buttonText, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(300, 48),
        backgroundColor: BRColors.greenDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () async => onPressed(),
      child: Text(
        buttonText,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}