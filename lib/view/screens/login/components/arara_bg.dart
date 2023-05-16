import 'package:bioreino_mobile/view/global_components/assets/brassets.dart';
import 'package:flutter/material.dart';

class AraraBackGround extends StatelessWidget {
  const AraraBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Image.asset(
        BRAssets.araraImage,
        fit: BoxFit.cover,
        alignment: const Alignment(0.3, 0),
      ),
    );
  }
}
