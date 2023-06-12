import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/updatable_drawer_mixin.dart';
import 'package:bioreino_mobile/controller/util/theme_util.dart';
import 'package:bioreino_mobile/model/student.dart';
import 'package:bioreino_mobile/view/global_components/widgets/info_text.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AccountPage extends StatelessWidget {
  final UpdatableDrawer drawer;
  const AccountPage(this.drawer, {super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final Student student = StudentDAO.student!;
    final TextTheme theme = Theme.of(context).textTheme;
    return BasePage(
      drawer,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                "Informações da Conta",
                style: theme.headlineLarge?.copyWith(
                    color: fromBrightnessColor(
                      context,
                      Colors.black,
                      Colors.white,
                    ),
                    fontSize: 32),
              ),
              InfoText(theme, "Nome: ", student.name),
              InfoText(theme, "E-mail: ", student.email),
              InfoText(
                theme,
                "Data de inscrição: ",
                DateFormat("dd/MM/yyyy", "br").format(student.subscriptionDate),
              ),
              InfoText(theme, "Plano: ", student.plan.toUpperCase())
            ],
          ),
        ),
      ),
    );
  }
}


