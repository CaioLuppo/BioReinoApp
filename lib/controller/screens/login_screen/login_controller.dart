import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/controller/screens/splash_screen/route_animation.dart';
import 'package:bioreino_mobile/view/screens/login/login_screen.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';

void tryLogin({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required String email,
  required String password,
  required void Function() onConnectionError,
  required void Function() onWrongCredentials,
}) async {
  if (formKey.currentState!.validate()) {
    await Future.delayed(const Duration(seconds: 1));
    final result = await StudentDAO.login(formKey, email, password);
    if (context.mounted) {
      if (result == LoginState.logged) {
        changeScreen(context, const ScreenNavigator());
        return;
      } else if (result == LoginState.error) {
        onConnectionError();
      } else if (result == LoginState.wrongCredentials) {
        onWrongCredentials();
      }
      setLoginButtonPressed(false);
    }
  }
}

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
  return validateLoginForm(formKey);
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
