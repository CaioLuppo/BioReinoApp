part of screen_navigator;

final AppBar appBar = AppBar(
  toolbarHeight: 86,
  elevation: 0,
  centerTitle: true,
  leading: Builder(
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: SvgPicture.asset(
            "assets/drawer_icons/drawer_button_icon.svg",
            height: 24,
          ),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
      );
    },
  ),
  title: Padding(
    padding: const EdgeInsets.only(left: 0.0),
    child: SvgPicture.asset(
      BRAssets.bioreinoExtense,
      height: 42,
    ),
  ),
);
