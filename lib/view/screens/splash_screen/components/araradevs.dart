part of splash_screen;

class AraradevsIcon extends StatelessWidget {
  const AraradevsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        fromBrightnessColor(context, BRColors.blackDark, BRColors.greyText),
        BlendMode.srcIn,
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SvgPicture.asset(
          BRAssets.araradevsIcon,
          alignment: Alignment.center,
          height: 32,
        ),
      ),
    );
  }
}
