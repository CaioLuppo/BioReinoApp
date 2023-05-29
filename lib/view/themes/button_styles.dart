part of br_themes;

ButtonStyle flatButtonStyle() {
  return ButtonStyle(
    overlayColor: mStateColor(BRColors.greenLight.withAlpha(20)),
    backgroundColor: mStateColor(Colors.transparent),
    shadowColor: mStateColor(Colors.transparent),
    elevation: const MaterialStatePropertyAll(0),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}