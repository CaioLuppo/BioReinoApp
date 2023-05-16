import 'package:flutter/material.dart';

import 'package:bioreino_mobile/controller/screens/login_screen/login_controller.dart';
import 'package:bioreino_mobile/controller/screens/login_screen/login_form_controller.dart';
import 'package:bioreino_mobile/view/global_components/widgets/loading_bar.dart';
import 'package:bioreino_mobile/view/screens/login/components/arara_bg.dart';
import 'package:bioreino_mobile/view/screens/login/components/login_box_bg.dart';
import 'package:bioreino_mobile/view/screens/login/components/login_button.dart';
import 'package:bioreino_mobile/view/screens/login/components/login_field_box.dart';
import 'package:bioreino_mobile/view/screens/login/components/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  final String _buttonText = "Entrar";
  final String _headerText = "Entre com sua conta!";

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static bool wrongCredentials = false;
  static bool failedConnection = false;
  static bool buttonPressed = false;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget? bottomWidget;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _tryLoginOnButtonPressed(context);
    _changeBottomWidget();
    return Stack(
      children: [
        const AraraBackGround(),
        LoginBoxBg(
          scaffoldKey: LoginScreen.scaffoldKey,
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Header(widget._headerText),
                LoginFieldBox(
                  LoginScreen.emailController,
                  LoginScreen.passwordController,
                  onTextChanged: () {
                    if (LoginScreen.wrongCredentials) {
                      setState(
                        () {
                          setWrongCredentials(false, _formKey);
                          validateLoginForm(_formKey);
                        },
                      );
                    }
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: bottomWidget,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _changeBottomWidget() {
    bottomWidget = LoginScreen.buttonPressed
        ? const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: LoadingBar(),
          )
        : LoginButtonBar(
            widget._buttonText,
            formKey: _formKey,
            onPressed: () => setState(() => setLoginButtonPressed(true)),
          );
  }

  void _tryLoginOnButtonPressed(BuildContext context) {
    if (LoginScreen.buttonPressed) {
      tryLogin(
        context: context,
        formKey: _formKey,
        email: LoginScreen.emailController.text,
        password: LoginScreen.passwordController.text,
        onWrongCredentials: () => setState(() {
          setWrongCredentials(true, _formKey);
        }),
        onConnectionError: () => setState(() {
          setFailedConnection(true);
          showErrorSnackBar();
        }),
      );
    }
  }
}
