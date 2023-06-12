part of login_screen;

class LoginFieldBox extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function() enterKeyboardPressed;
  final Uri uri = Uri.parse(
      "https://bioreino-vercel.vercel.app/login/inscreva/professional");

  LoginFieldBox(
    this.emailController,
    this.passwordController,
    this.enterKeyboardPressed, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          EmailField(
            "E-mail",
            emailController,
          ),
          PasswordField(
            "Senha",
            passwordController,
            enterKeyboardPressed,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Não tem uma conta? ",
                      style: Theme.of(context).textTheme.bodyMedium),
                  TextSpan(
                    text: "Clique aqui!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: BRColors.green),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => launchUrl(uri),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
