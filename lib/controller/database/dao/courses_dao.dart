import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/controller/database/mongodb.dart';
import 'package:bioreino_mobile/model/course.dart';

class CoursesDAO {
  static List<Course> coursesList = [];

  static Future<List<Course>> getAll() async {
    if (coursesList.isEmpty) {
      Map<String, dynamic> query = {};
      if (StudentDAO.student?.plan != "professional") {
        query = {"plan": StudentDAO.student!.plan};
      }

      var result = await Database.coursesCollection?.find(
        query,
      ).toList();
      List<Course> list = [];
      result?.forEach((element) => list.add(Course(element)));
      coursesList = list;
      return list;
    }
    return coursesList;
  }
}
