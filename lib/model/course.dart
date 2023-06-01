import 'package:bioreino_mobile/model/lesson.dart';

class Course {
  final String name;
  final String professor;
  final String imageUrl;
  final String plan;
  final String category;
  List<Lesson>? lessons;

  Course(Map<String, dynamic> map)
      : name = map["title"],
        professor = map["professor"],
        imageUrl = map["imageUrl"],
        plan = map["plan"],
        category = map["category"];
}
