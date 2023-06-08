part of screen_navigator;

class BRAppBar extends AppBar {
  BRAppBar({required Widget leading, super.key})
      : super(
          toolbarHeight: 86,
          elevation: 0,
          centerTitle: true,
          leading: leading,
          title: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: SvgPicture.asset(
              BRAssets.bioreinoExtense,
              height: 42,
            ),
          ),
        );
}
