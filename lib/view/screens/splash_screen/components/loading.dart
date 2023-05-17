part of splash_screen;

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isThemeLight(context)
            ? SvgPicture.asset(
                BRAssets.bioreinoSimple,
                height: 80,
              )
            : ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  BRAssets.bioreinoSimple,
                  height: 80,
                ),
              ),
        const SizedBox(height: 32),
        const LoadingBar()
      ],
    );
  }
}
