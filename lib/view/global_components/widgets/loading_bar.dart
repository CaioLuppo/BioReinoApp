import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            backgroundColor: Colors.white12,
            color: BRColors.greyText,
          ),
        ),
      ),
    );
  }
}
