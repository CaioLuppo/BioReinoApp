import 'package:bioreino_mobile/controller/database/dao/categories_dao.dart';
import 'package:bioreino_mobile/controller/database/dao/courses_dao.dart';
import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/controller/util/string_util.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/pages/home/home_page.dart';
import 'package:flutter/material.dart';

List<Widget> courseListFilter({
  required BuildContext context,
  required String filter,
  required Function setState,
  String categoryName = "",
}) {
  Orientation orientation = MediaQuery.of(context).orientation;

  final List<Widget> list = [];
  for (var course in CoursesDAO.coursesList) {
    filter = filter.toLowerCase();
    final name = course.name.toLowerCase();
    final professor = course.professor.toLowerCase();
    final courseCategory = course.category.name.toLowerCase();

    if ((name.contains(filter) || professor.contains(filter)) &&
        courseCategory.contains(categoryName)) {
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
            progress: StudentDAO.student!.getProgress(course),
            setState: () => setState(),
          ),
        ),
      );
    }
  }

  return list;
}

List<DropdownMenuItem<String>> generateCategoriesMenuList(
    BuildContext context) {
  final List<DropdownMenuItem<String>> list = List.generate(
    CategoriesDAO.categories.length,
    (index) => DropdownMenuItem<String>(
      value: CategoriesDAO.categories[index].name,
      child: Text(
        CategoriesDAO.categories[index].name.capitalize(),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ),
  );
  list.insert(
    0,
    DropdownMenuItem<String>(
      value: "",
      child: Text(
        "Qualquer",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ),
  );
  return list;
}
