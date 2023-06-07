part of login_screen;

class EmailField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey = GlobalKey();

  EmailField(this.label, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focused) {
        if (!focused) fieldKey.currentState?.validate();
      },
      child: TextFormField(
        key: fieldKey,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(PasswordField.focusNode);
        },
        controller: controller,
        validator: (value) {
          if (controller.text.isEmpty) {
            return "Campo vazio!";
          }
          final regex = RegExp("^[\\w-\\.]+@([\\w-]+\\.)+[A-z]{2,4}\$");
          if (!regex.hasMatch(controller.text)) {
            return "Insira um e-mail válido!";
          } else if (LoginScreen.wrongCredentials) {
            return "E-mail ou senha incorretos!";
          }
          return null;
        },
        decoration: InputDecoration(
          label: Text(label),
        ),
        style: Theme.of(context).textTheme.bodyLarge,
        keyboardType: TextInputType.emailAddress,
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

class PasswordField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey = GlobalKey();
  final void Function() enterKeyboardPressed;
  static final focusNode = FocusNode();

  PasswordField(
    this.label,
    this.controller,
    this.enterKeyboardPressed, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focused) {
        if (!focused) fieldKey.currentState?.validate();
      },
      child: TextFormField(
        key: fieldKey,
        focusNode: focusNode,
        textInputAction: TextInputAction.go,
        onFieldSubmitted: (_) => enterKeyboardPressed(),
        controller: controller,
        validator: (value) {
          if (controller.text.isEmpty) {
            return "Campo vazio!";
          } else if (LoginScreen.wrongCredentials) {
            return "E-mail ou senha incorretos!";
          }
          return null;
        },
        decoration: InputDecoration(
          label: Text(label),
        ),
        obscureText: true,
        style: Theme.of(context).textTheme.bodyLarge,
        keyboardType: TextInputType.emailAddress,
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
