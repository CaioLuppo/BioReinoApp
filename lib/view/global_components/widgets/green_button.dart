import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  final Size size;

  const GreenButton(this.buttonText, this.size, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: size,
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
