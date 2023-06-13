import 'package:bioreino_mobile/controller/database/dao/categories_dao.dart';
import 'package:bioreino_mobile/model/category.dart';
import 'package:bioreino_mobile/model/lesson.dart';

class Course {
  final String name;
  final String professor;
  final String imageUrl;
  final String plan;
  final Category category;
  List<Lesson>? lessons;

  factory Course.fromMap(Map<String, dynamic> map) {
    Category? getCategory(String name) {
      for (var category in CategoriesDAO.categories) {
        if (category.name == name) {
          return category;
        }
      }
      return Category({"plan":"scholar", "name":""});
    }

    return Course(
      name: map["title"],
      professor: map["professor"],
      imageUrl: map["imageUrl"],
      plan: map["plan"],
      category: getCategory(map["category"])!,
    );
  }

  Course({
    required this.name,
    required this.professor,
    required this.imageUrl,
    required this.plan,
    required this.category,
  });
}
