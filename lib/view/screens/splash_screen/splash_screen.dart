library splash_screen;

import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/controller/screens/splash_screen/route_animation.dart';
import 'package:bioreino_mobile/controller/util/theme_util.dart';
import 'package:bioreino_mobile/view/global_components/assets/brassets.dart';
import 'package:bioreino_mobile/view/global_components/widgets/loading_bar.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'components/araradevs.dart';
part 'components/loading.dart';

class SplashScreen extends StatefulWidget {
  final bool isLogout;

  const SplashScreen({this.isLogout = false, super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isLogout) {
        await StudentDAO.logout(context);
      }
      if (context.mounted) {
        connectAndChangeScreen(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Align(alignment: Alignment.center, child: Loading()),
          Align(alignment: Alignment.bottomCenter, child: AraradevsIcon()),
        ],
      ),
    );
  }
}
