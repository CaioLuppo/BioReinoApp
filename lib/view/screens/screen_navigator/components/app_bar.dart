part of screen_navigator;

final AppBar appBar = AppBar(
  toolbarHeight: 86,
  elevation: 0,
  centerTitle: true,
  title: Padding(
    padding: const EdgeInsets.only(left: 0.0),
    child: SvgPicture.asset(
      BRAssets.bioreinoExtense,
      height: 42,
    ),
  ),
);
