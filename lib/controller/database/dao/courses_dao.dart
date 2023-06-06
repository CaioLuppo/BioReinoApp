import 'package:bioreino_mobile/controller/database/dao/lessons_dao.dart';
import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/controller/database/mongodb_database.dart';
import 'package:bioreino_mobile/model/category.dart';
import 'package:bioreino_mobile/model/course.dart';
import 'package:flutter/material.dart';

class CoursesDAO {
  static List<Course> coursesList = [];

  static Future<List<Category>> getCategories(BuildContext context) async {
    await Database.connectOrError(context);

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

  static Future<List<Course>> getAll(BuildContext context) async {
    final query = _defineQuery();
    List<Course> list = [];
    final result = await Database.coursesCollection?.find(query).toList();

    if (result != null) {
      for (var course in result) {
        final thisCourse = Course(course);
        if (context.mounted) {
          thisCourse.lessons =
              await LessonsDAO.getAllFrom(thisCourse.name, context);
          list.add(thisCourse);
        }
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
