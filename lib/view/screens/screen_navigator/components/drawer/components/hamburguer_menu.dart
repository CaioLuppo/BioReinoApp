part of screen_navigator;

class HamburguerMenu extends StatelessWidget {
  const HamburguerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            hoverColor: splashColor,
            splashColor: splashColor,
            highlightColor: splashColor,
            splashRadius: 24,
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: SvgPicture.asset(
              "assets/drawer_icons/drawer_button_icon.svg",
              height: 24,
            ),
            tooltip: "Abre o menu",
          ),
        );
      },
    );
  }
}
