import 'package:realm/realm.dart';

class Student {
  final ObjectId _id;
  final String cpf;
  final String name;
  final String plan;
  final DateTime subscriptionDate;
  final String email;
  final String password;
  final List<CourseProgress> progressArray;
  final LastCourse? lastCourse;

  Student(
    this._id,
    this.cpf,
    this.name,
    this.plan,
    this.subscriptionDate,
    this.email,
    this.password,
    this.progressArray,
    this.lastCourse,
  );
}

class CourseProgress {
  late String courseId;
  late LessonProgress? lessonProgress;
}

class LastCourse {
  late String courseId;
  late String lastLessonId;
}

class LessonProgress {
  late String lessonId;
  late bool complete;
}
