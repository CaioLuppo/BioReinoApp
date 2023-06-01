class Lesson {
  String title;
  String description;
  String videoUrl;
  String transcription;
  String courseTitle;

  Lesson(Map<String, dynamic> map)
      : title = map["title"],
        description = map["description"],
        videoUrl = map["videoUrl"],
        transcription = map["transcription"],
        courseTitle = map["courseTitle"];
}
