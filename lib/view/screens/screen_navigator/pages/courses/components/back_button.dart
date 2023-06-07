part of screen_navigator;

class BackButton extends StatelessWidget {
  final UpdatableDrawer drawer;
  const BackButton(this.drawer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: IconButton(
        onPressed: () => drawer.updatePage(Pages.home),
        splashRadius: 24,
        icon: SvgPicture.asset(
          "assets/drawer_icons/back_button_icon.svg",
          colorFilter: ColorFilter.mode(BRColors.greyText, BlendMode.srcIn),
        ),
      ),
    );
  }
}
