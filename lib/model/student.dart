import 'package:bioreino_mobile/model/course.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../controller/database/mongodb_database.dart';

class Student {
  final ObjectId? id;
  final String name;
  final String plan;
  final DateTime subscriptionDate;
  final String email;
  final String? password;
  Map<String, dynamic>? coursesProgress;
  Map<String, dynamic>? lastCourse;

  Student(
    this.id,
    this.name,
    this.plan,
    this.subscriptionDate,
    this.email,
    this.password,
    this.coursesProgress,
    this.lastCourse,
  );

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      null,
      map["name"],
      map["plan"],
      map["subscriptionDate"],
      map["email"],
      null,
      map["coursesProgress"],
      map["lastCourse"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "_id": id,
      "name": name,
      "plan": plan,
      "subscriptionDate": subscriptionDate.millisecondsSinceEpoch,
      "email": email,
      "password": password,
      "coursesProgress": coursesProgress,
      "lastCourse": lastCourse,
    };
  }

  double getProgress(Course course) {
    if (coursesProgress?[course.name] == null) {
      return 0;
    } else {
      final List<dynamic> lessons = coursesProgress?[course.name] ?? [];
      final int? max = course.lessons?.length;

      if (max == null) return 0;

      int completed = 0;
      for (var _ in lessons) {
        completed++;
      }

      return (completed * 100) / max;
    }
  }

  bool isLessonComplete(String courseName, String lessonTitle) {
    if (coursesProgress != null) {
      List progressList = coursesProgress![courseName] ?? [];
      for (var lessonNameInList in progressList) {
        if (lessonNameInList == lessonTitle) {
          return true;
        }
      }
    }
    return false;
  }

  void addProgress(String courseName, {String? lessonTitle}) {
    coursesProgress ??= {};
    if (coursesProgress![courseName] == null) {
      coursesProgress![courseName] = [];
    }
    if (lessonTitle != null) {
      List<String> progressList = coursesProgress![courseName]!;
      if (!progressList.contains(lessonTitle)) {
        progressList.add(lessonTitle);
      }
    }
    Database.studentsCollection!.updateOne(
      where.eq("email", email),
      ModifierBuilder().set("coursesProgress", coursesProgress),
    );
  }
}
