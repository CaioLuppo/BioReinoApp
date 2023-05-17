part of login_screen;

class LoginField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final LoginFieldType type;
  final GlobalKey<FormFieldState> fieldKey = GlobalKey();

  LoginField(this.label, this.controller, this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focused) {
        if (!focused) fieldKey.currentState?.validate();
      },
      child: TextFormField(
        key: fieldKey,
        controller: controller,
        validator: (value) {
          if (controller.text.isEmpty) {
            return "Campo vazio!";
          }
          if (type == LoginFieldType.email) {
            final regex = RegExp("^[\\w-\\.]+@([\\w-]+\\.)+[A-z]{2,4}\$");
            if (!regex.hasMatch(controller.text)) {
              return "Insira um e-mail válido!";
            }
          }
          if (LoginScreen.wrongCredentials) {
            return "E-mail ou senha incorretos!";
          }
          return null;
        },
        decoration: InputDecoration(
          label: Text(label),
        ),
        obscureText: type == LoginFieldType.password ? true : false,
        style: Theme.of(context).textTheme.bodyLarge,
        keyboardType:
            type == LoginFieldType.email ? TextInputType.emailAddress : null,
        onChanged: (_) {
          if (LoginScreen.wrongCredentials) {
            setWrongCredentials(false);
            LoginScreen.formKey.currentState?.validate();
          }
        },
      ),
    );
  }
}

enum LoginFieldType {
  email,
  password,
}
