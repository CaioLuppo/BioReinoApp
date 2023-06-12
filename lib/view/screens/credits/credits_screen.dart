import 'package:bioreino_mobile/controller/util/theme_util.dart';
import 'package:bioreino_mobile/view/global_components/widgets/info_text.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:flutter/material.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: BRAppBar(
        leading: BRBackButton(
          () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Créditos de Imagens",
                style: theme.headlineLarge?.copyWith(
                    color: fromBrightnessColor(
                      context,
                      Colors.black,
                      Colors.white,
                    ),
                    fontSize: 32),
              ),
            ),
            InfoText(
              theme,
              "Arara (Login): ",
              "Imagem de christian-mts0 por Pixabay",
              wrap: true,
            ),
            InfoText(
              theme,
              "What? (Erro): ",
              "'Confused stickers' criado por Stickers - Flaticon",
              wrap: true,
            ),
            InfoText(
              theme,
              "Garota triste (Logout): ",
              "'Sad stickers' criado por kerismaker - Flaticon (Modificado por Caio Luppo)",
              wrap: true,
            ),
            InfoText(
              theme,
              "Icone da sessão cursos (Menu): ",
              "'Course icons' criado por Tanah Basah - Flaticon",
              wrap: true,
            ),
            InfoText(
              theme,
              "Imagens e logos do BioReino: ",
              "Caio Luppo Ribeiro",
              wrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
