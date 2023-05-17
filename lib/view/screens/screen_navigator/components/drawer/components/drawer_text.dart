part of drawer;

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
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: color, fontWeight: fontWeight),
        );
}
