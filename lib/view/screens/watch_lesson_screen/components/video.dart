part of watch_lesson_screen;

class Video extends StatelessWidget {
  const Video({
    super.key,
    required this.controller,
  });

  final yt.YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(20),
        child: yt.YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: false,
          actionsPadding: const EdgeInsets.only(left: 16, right: 8),
          bottomActions: [
            yt.CurrentPosition(),
            yt.ProgressBar(
              isExpanded: true,
              colors: yt.ProgressBarColors(
                backgroundColor: BRColors.greyText,
                playedColor: BRColors.greenLight,
              ),
            ),
            const yt.PlaybackSpeedButton(),
            yt.FullScreenButton(),
          ],
        ),
      ),
    );
  }
}
