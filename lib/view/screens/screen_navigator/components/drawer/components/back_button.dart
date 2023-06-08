part of screen_navigator;

class BRBackButton extends StatelessWidget {
  final Function() onPressed;
  final double splashRadius;
  final double iconSize;
  const BRBackButton(
    this.onPressed, {
    this.splashRadius = 24,
    this.iconSize = 64,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: IconButton(
        tooltip: "Volta pra tela inicial",
        highlightColor: splashColor,
        hoverColor: splashColor,
        splashColor: splashColor,
        onPressed: () => onPressed(),
        splashRadius: splashRadius,
        icon: SvgPicture.asset(
          "assets/drawer_icons/back_button_icon.svg",
          width: iconSize,
          colorFilter: ColorFilter.mode(BRColors.greyText, BlendMode.srcIn),
        ),
      ),
    );
  }
}
