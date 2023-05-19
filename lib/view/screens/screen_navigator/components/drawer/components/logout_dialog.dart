part of drawer;

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 16),
      actions: [
        TextButton(
          onPressed: () => changeScreen(
            context,
            const SplashScreen(isLogout: true),
            leftToRight: true,
          ),
          style: flatButtonStyle(),
          child: DrawerText(
            "sim",
            context,
            color: BRColors.greenDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          style: flatButtonStyle(),
          onPressed: () => Navigator.of(context).pop(),
          child: DrawerText(
            "não",
            context,
            color: BRColors.greenDark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
      content: Padding(
        padding: const EdgeInsets.only(
          right: 8,
          left: 8,
          top: 16,
        ),
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Image.asset(
                BRAssets.brokenHeart,
                width: 200,
              ),
            ),
            Text(
              "Mas já?!",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: fromBrightnessColor(
                      context,
                      Colors.black,
                      Colors.white,
                    ),
                  ),
            ),
            SizedBox(
              width: 250,
              child: Text(
                "Deseja mesmo sair? Poderá logar novamente sempre quando quiser!",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: fromBrightnessColor(
                        context,
                        Colors.black87,
                        Colors.white70,
                      ),
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
