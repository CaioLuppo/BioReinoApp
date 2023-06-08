part of watch_lesson_screen;

class Transcription extends StatelessWidget {
  const Transcription({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Text(
                text,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: fromBrightnessColor(
                        context,
                        Colors.black,
                        Colors.white70,
                      ),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
