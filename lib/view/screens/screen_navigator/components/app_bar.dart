part of screen_navigator;

class BRAppBar extends AppBar {
  BRAppBar({UpdatableDrawer? drawer, super.key})
      : super(
          toolbarHeight: 86,
          elevation: 0,
          centerTitle: true,
          leading: drawer != null
              ? BackButton(drawer)
              : Builder(
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
                ),
          title: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: SvgPicture.asset(
              BRAssets.bioreinoExtense,
              height: 42,
            ),
          ),
        );
}
