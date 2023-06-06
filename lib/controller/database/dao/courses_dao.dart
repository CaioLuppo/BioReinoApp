import 'package:bioreino_mobile/controller/database/dao/lessons_dao.dart';
import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/controller/database/mongodb_database.dart';
import 'package:bioreino_mobile/model/category.dart';
import 'package:bioreino_mobile/model/course.dart';

class CoursesDAO {
  static List<Course> coursesList = [];

  static Future<List<Category>> getCategories() async {
    final query = _defineQuery();
    final List<Category> list = [];
    
    final result = await Database.categoriesCollection?.find(query).toList();
    if (result != null) {
      for (var category in result) {
        list.add(Category(category));
      }
    }

    return list;
  }

  static Future<List<Course>> getAll() async {
    final query = _defineQuery();
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
