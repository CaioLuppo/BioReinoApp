part of login_screen;

class LoginFieldBox extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function onTextChanged;

  const LoginFieldBox(
    this.emailController,
    this.passwordController, {
    required this.onTextChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginField(
            "E-mail",
            emailController,
            LoginFieldType.email,
            onChanged: () => onTextChanged()
          ),
          LoginField(
            "Senha",
            passwordController,
            LoginFieldType.password,
            onChanged: () => onTextChanged(),
          ),
        ],
      ),
    );
  }

}
