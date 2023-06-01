import 'package:bioreino_mobile/controller/database/dao/lessons_dao.dart';
import 'package:bioreino_mobile/model/course.dart';
import 'package:realm/realm.dart';

class Student {
  final ObjectId? id;
  final String name;
  final String plan;
  final DateTime subscriptionDate;
  final String email;
  final String? password;
  final Map<String, dynamic>? coursesProgress;
  final Map<String, dynamic>? lastCourse;

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
      "progressArray": coursesProgress,
      "lastCourse": lastCourse,
    };
  }

  Future<double> getProgress(Course course) async {
    if (coursesProgress?[course.name] == null) {
      return 0;
    } else {
      final List<dynamic> lessons = coursesProgress?[course.name];
      final int max = await _getMax(course);

      int completed = 0;
      for (var _ in lessons) {
        completed++;
      }

      return (completed * 100) / max;
    }
  }

  Future<int> _getMax(Course course) async {
    if (course.lessons == null) {
      return await LessonsDAO.getAllFrom(course.name)
          .then((value) => value.length);
    } else {
      return course.lessons!.length;
    }
  }
}
