import 'package:bioreino_mobile/controller/screens/login_screen/login_controller.dart';
import 'package:bioreino_mobile/view/global_components/widgets/loading_bar.dart';
import 'package:flutter/material.dart';

import 'package:bioreino_mobile/view/screens/login/login_screen.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';

void setLoginButtonPressed(bool value) {
  LoginScreen.buttonPressed = value;
}

void setWrongCredentials(bool value) {
  LoginScreen.wrongCredentials = value;
}

void onFailedConnection() {
  debugPrint("Conexão Falhou");
  LoginScreen.failedConnection = true;
  showErrorSnackBar();
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

Widget chooseBottomWidget({
  required String buttonText,
  required GlobalKey<FormState> formKey,
  required void Function() onPressed,
}) {
  return LoginScreen.buttonPressed
      ? const Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: LoadingBar(),
        )
      : LoginButtonBar(
          buttonText,
          formKey: formKey,
          onPressed: onPressed,
        );
}

void tryLoginOnButtonPressed({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required void Function() onWrongCredentials,
  required void Function() onConnectionError,
}) {
  if (LoginScreen.buttonPressed) {
    tryLogin(
      context: context,
      formKey: formKey,
      email: LoginScreen.emailController.text,
      password: LoginScreen.passwordController.text,
      onWrongCredentials: () => onWrongCredentials(),
      onConnectionError: () => onConnectionError(),
    );
  }
}

void clearFields() {
  LoginScreen.passwordController.text = "";
  LoginScreen.emailController.text = "";
  LoginScreen.buttonPressed = false;
  LoginScreen.failedConnection = false;
  LoginScreen.wrongCredentials = false;
}
