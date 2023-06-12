import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/model/course.dart';
import 'package:bioreino_mobile/model/lesson.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../controller/database/mongodb_database.dart';

class Student {
  final ObjectId? id;
  final String name;
  final String plan;
  final DateTime subscriptionDate;
  final String email;
  String? password;
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
      map["password"],
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

  void addProgress(Course course, {Lesson? lesson}) {
    coursesProgress ??= {};
    if (coursesProgress![course.name] == null) {
      coursesProgress![course.name] = [];
    }
    if (lesson != null) {
      List<dynamic> progressList = coursesProgress![course.name]!;
      if (!progressList.contains(lesson.title)) {
        progressList.add(lesson.title);
      }
    }
    _addLastCourse(course, lesson: lesson);
    Database.studentsCollection!.updateOne(
      where.eq("email", email),
      ModifierBuilder().set("coursesProgress", coursesProgress),
    );
  }

  void _addLastCourse(Course course, {Lesson? lesson}) {
    lastCourse = {
      "courseTitle": course.name,
      "professor": course.professor,
      "imageUrl": course.imageUrl,
      "lastLesson": lesson != null
          ? {
              "lessonTitle": lesson.title,
              "lessonDescription": lesson.description,
            }
          : null,
    };
    Database.studentsCollection!.updateOne(
      {"email": StudentDAO.student!.email},
      ModifierBuilder().set("lastCourse", lastCourse),
    );
  }
}
