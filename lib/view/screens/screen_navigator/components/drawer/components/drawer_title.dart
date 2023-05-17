part of drawer;

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