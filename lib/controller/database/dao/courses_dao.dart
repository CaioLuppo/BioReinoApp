import 'package:bioreino_mobile/controller/database/dao/lessons_dao.dart';
import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/controller/database/mongodb.dart';
import 'package:bioreino_mobile/model/course.dart';

class CoursesDAO {
  static List<Course> coursesList = [];

  static Future<List<Course>> getAll() async {
    Map<String, dynamic> query = _defineQuery();
    List<Course> list = [];
    final result = await Database.coursesCollection?.find(query).toList();

    if (result != null) {
      for (var course in result) {
        final thisCourse = Course(course);
        thisCourse.lessons = await LessonsDAO.getAllFrom(thisCourse.name);
        list.add(thisCourse);
      }
    }
    
    coursesList = list;

    return list;
  }

  static Map<String, dynamic> _defineQuery() {
    if (StudentDAO.student?.plan != "professional") {
      return {"plan": StudentDAO.student!.plan};
    } else {
      return {};
    }
  }
}
