import 'package:bioreino_mobile/controller/database/dao/courses_dao.dart';
import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/pages/home/home.dart';
import 'package:flutter/material.dart';

List<Widget> courseFilter(String filter, BuildContext context) {
  Orientation orientation = MediaQuery.of(context).orientation;
  final List<Widget> list = [];
  for (var course in CoursesDAO.coursesList) {
    filter = filter.toLowerCase();
    final name = course.name.toLowerCase();
    final professor = course.professor.toLowerCase();
    if (name.contains(filter) || professor.contains(filter)) {
      list.add(
        Padding(
          padding: EdgeInsets.only(
            bottom: orientation == Orientation.landscape ? 0 : 24,
            left: orientation == Orientation.landscape ? 8 : 0,
            right: orientation == Orientation.landscape ? 8 : 0,
          ),
          child: CourseCard(
              imageHeight: 175,
              course: course,
              progress: StudentDAO.student!.getProgress(course)),
        ),
      );
    }
  }
  return list;
}
