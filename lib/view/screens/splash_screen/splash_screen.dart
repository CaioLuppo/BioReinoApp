import 'package:bioreino_mobile/controller/screens/splash_screen/route_animation.dart';
import 'package:bioreino_mobile/view/screens/splash_screen/components/araradevs.dart';
import 'package:bioreino_mobile/view/screens/splash_screen/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Assets
final SvgPicture bioreinoSimple = SvgPicture.asset(
  "assets/splash_screen_icons/bioreino_simple.svg",
  height: 80,
);
final SvgPicture araradevsIcon = SvgPicture.asset(
  "assets/splash_screen_icons/araradevs_icon.svg",
  alignment: Alignment.center,
  height: 32,
);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      connectAndChangeScreen(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: const [
          Align(
            alignment: Alignment.center,
            child: Loading(),
          ),
          Align(alignment: Alignment.bottomCenter, child: AraradevsIcon())
        ],
      ),
    );
  }
}
