library watch_lesson_screen;

import 'package:bioreino_mobile/controller/screens/watch_lesson_screen/pop.dart';
import 'package:bioreino_mobile/controller/util/theme_util.dart';
import 'package:bioreino_mobile/model/course.dart';
import 'package:bioreino_mobile/model/lesson.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/pages/home/home_page.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as yt;

part 'components/transcription.dart';
part 'components/video.dart';

class WatchLessonScreen extends StatefulWidget {
  final Course course;
  final Lesson lesson;
  const WatchLessonScreen(this.course, this.lesson, {super.key});

  @override
  State<WatchLessonScreen> createState() => _WatchLessonScreenState();
}

class _WatchLessonScreenState extends State<WatchLessonScreen> {
  late yt.YoutubePlayerController controller;

  @override
  void initState() {
    controller = yt.YoutubePlayerController(
      initialVideoId: yt.YoutubePlayer.convertUrlToId(widget.lesson.videoUrl)!,
      flags: const yt.YoutubePlayerFlags(
        loop: false,
        autoPlay: false,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => popLesson(context, controller),
      child: Scaffold(
        body: yt.YoutubePlayerBuilder(
          player: Video(controller: controller),
          builder: (context, player) {
            if (MediaQuery.of(context).orientation == Orientation.portrait) {
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
            }
            return SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(20),
                          child: player,
                        ),
                      ),
                      // Texts
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          widget.lesson.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: fromBrightnessColor(
                                  context,
                                  Colors.black,
                                  Colors.white,
                                ),
                                fontFamily: GoogleFonts.fredoka().fontFamily,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          widget.lesson.description,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: fromBrightnessColor(
                                      context,
                                      Colors.black,
                                      Colors.white70,
                                    ),
                                  ),
                        ),
                      ),
                      // Divider
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          color: BRColors.greyText,
                          thickness: 2,
                        ),
                      ),
                      // Text
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "TRANSCRIÇÃO",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      widget.lesson.transcription.isEmpty
                          ? const Expanded(
                              child: EmptyList(
                                "Ainda não há transcrição disponível.",
                              ),
                            )
                          : Transcription(text: widget.lesson.transcription),
                    ],
                  ),
                  // BackButton
                  Align(
                    alignment: const Alignment(-1, -1),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 22.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(64),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-1, -0.95),
                    child: BRBackButton(
                      () => popLesson(context, controller),
                      iconSize: 24,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
