part of login_screen;

class LoginFieldBox extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function() enterKeyboardPressed;

  const LoginFieldBox(
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
        ],
      ),
    );
  }
}
