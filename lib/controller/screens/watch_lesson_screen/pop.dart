import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Future<bool> popLesson(BuildContext context, YoutubePlayerController controller) {
  controller.dispose();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  Navigator.pop(context);
  return Future.value(true);
}
