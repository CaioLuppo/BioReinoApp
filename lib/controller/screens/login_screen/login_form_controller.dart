import 'package:flutter/material.dart';

import 'package:bioreino_mobile/view/screens/login/login_screen.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';

setLoginButtonPressed(bool value) {
  LoginScreen.buttonPressed = value;
}

setWrongCredentials(bool value, GlobalKey<FormState> formKey) {
  LoginScreen.wrongCredentials = value;
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (LoginScreen.wrongCredentials) {
      validateLoginForm(formKey);
    }
  });
}

setFailedConnection(bool value) {
  LoginScreen.failedConnection = value;
}

bool? validateLoginForm(GlobalKey<FormState> formKey) {
  return formKey.currentState?.validate();
}

void showErrorSnackBar() {
  const String errorText = "A conexão falhou! Tente novamente.";
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(LoginScreen.scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: const Text(errorText),
        action: SnackBarAction(label: "OK", onPressed: () {}),
        backgroundColor: BRColors.blackDark,
      ),
    );
  });
}
