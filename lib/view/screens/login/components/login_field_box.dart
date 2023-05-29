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
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailField(
            "E-mail",
            emailController,
          ),
          PasswordField(
            "Senha",
            passwordController,
            enterKeyboardPressed
          ),
        ],
      ),
    );
  }
}
