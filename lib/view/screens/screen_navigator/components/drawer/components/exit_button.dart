part of drawer;

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 8,
          bottom: 8,
        ),
        child: ElevatedButton(
          onPressed: () => showExitConfirmation(context),
          style: flatButtonStyle(),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            children: [
              Icon(
                Icons.logout,
                color: BRColors.greyText,
                size: 16,
              ),
              DrawerText(
                "sair",
                context,
                color: BRColors.greyText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


