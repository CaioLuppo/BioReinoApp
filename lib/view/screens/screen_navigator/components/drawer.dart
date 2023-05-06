import 'package:bioreino_mobile/controller/screen_navigator/components/drawer_controller.dart';
import 'package:bioreino_mobile/controller/util/string_util.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BRDrawer extends Drawer {
  BRDrawer(final BuildContext context, final DrawerNavigator navigator,
      {super.key})
      : super(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView(
            children: [
              DrawerTitle("menu", context),
              DrawerContent(
                navigator,
                context,
                page: Pages.home,
                leadingSvgPath: "assets/drawer_icons/home_icon.svg",
                text: "home",
                index: 0,
              ),
              Divider(color: BRColors.greyText),
              DrawerTitle("perfil", context),
              DrawerContent(
                navigator,
                context,
                page: Pages.account,
                leadingSvgPath: "assets/drawer_icons/user_icon.svg",
                text: "conta",
                index: 1,
              ),
            ],
          ),
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
        child: super.build(context),
      ),
    );
  }
}

class DrawerTitle extends ListTile {
  DrawerTitle(String text, BuildContext context, {super.key})
      : super(
          title: DrawerText(
            text,
            context,
            color: BRColors.greyText,
          ),
        );
}

class DrawerContent extends ListTile {
  static int selectedIndex = 0;

  DrawerContent(
    DrawerNavigator drawerNavigator,
    BuildContext context, {
    super.key,
    required String text,
    required String leadingSvgPath,
    required Pages page,
    required int index,
  }) : super(
            onTap: () {
              drawerOnTap(drawerNavigator, page, context);
              selectedIndex = index;
            },
            minLeadingWidth: 0,
            leading: ColorFiltered(
              colorFilter: ColorFilter.mode(
                selectedIndex == index ? BRColors.green : BRColors.greyText,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                width: 28,
                leadingSvgPath,
                height: 28,
                alignment: Alignment.center,
              ),
            ),
            title: DrawerText(
              text,
              context,
              uppercase: false,
              fontWeight:
                  selectedIndex == index ? FontWeight.w600 : FontWeight.normal,
            ),
            selected: selectedIndex == index,
            selectedTileColor: BRColors.greenLight.withAlpha(20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8 * 1.06),
      child: super.build(context),
    );
  }
}

class DrawerText extends Text {
  DrawerText(
    String text,
    BuildContext context, {
    super.key,
    FontWeight fontWeight = FontWeight.normal,
    bool uppercase = true,
    Color? color,
  }) : super(
          uppercase ? text.toUpperCase() : text.capitalize(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: fontWeight),
        );
}
