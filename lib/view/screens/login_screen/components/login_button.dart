part of login_screen;

class LoginButtonBar extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String text;
  final void Function() onPressed;

  const LoginButtonBar(
    this.text, {
    required this.formKey,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          BRAssets.bioreinoExtense,
          height: 32,
        ),
        GreenButton(
          text,
          const Size(48, 48),
          () {
            if (formKey.currentState!.validate()) {
              onPressed();
            }
          },
        )
      ],
    );
  }
}
