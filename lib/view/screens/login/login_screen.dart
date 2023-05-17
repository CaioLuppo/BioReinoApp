library login_screen;

import 'package:bioreino_mobile/controller/screens/login_screen/login_form_controller.dart';
import 'package:bioreino_mobile/view/global_components/assets/brassets.dart';
import 'package:bioreino_mobile/view/global_components/widgets/green_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'components/arara_bg.dart';
part 'components/login_box_bg.dart';
part 'components/login_button.dart';
part 'components/login_field.dart';
part 'components/login_field_box.dart';
part 'components/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  // Strings
  final String _buttonText = "Entrar";
  final String _headerText = "Entre com sua conta!";

  // ScaffoldKey -> Para mostrar snackbar
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  // Controllers
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();

  // States
  static bool wrongCredentials = false;
  static bool failedConnection = false;
  static bool buttonPressed = false;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    clearFields();
  }

  @override
  Widget build(BuildContext context) {
    tryLoginOnButtonPressed(
      context: context,
      formKey: _formKey,
      onWrongCredentials: () => setState(() => setWrongCredentials(
            true,
            _formKey,
          )),
      onConnectionError: () => setState(() => onFailedConnection()),
    );
    final bottomWidget = chooseBottomWidget(
      buttonText: widget._buttonText,
      formKey: _formKey,
      onPressed: () => setState(() => setLoginButtonPressed(true)),
    );

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
                      setState(() => setWrongCredentials(false, _formKey));
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
}
