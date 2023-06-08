part of watch_lesson_screen;

class Video extends yt.YoutubePlayer {
  Video({
    super.key,
    required yt.YoutubePlayerController controller,
  }) : super(
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
        );
}
