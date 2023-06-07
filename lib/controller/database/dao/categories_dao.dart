import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/controller/database/mongodb_database.dart';
import 'package:bioreino_mobile/model/category.dart';
import 'package:flutter/material.dart';

class CategoriesDAO {
  static final List<Category> categories = [];

  static Future<List<Category>> getCategories(BuildContext context) async {
    await Database.connectOrError(context);

    final query = StudentDAO.defineQuery();

    final result = await Database.categoriesCollection?.find(query).toList();
    if (result != null) {
      for (var categoryMap in result) {
        final category = Category(categoryMap);
        for (var categoryInList in categories) {
          if (category.name == categoryInList.name) {
            return categories;
          }
        }
        categories.add(category);
      }
    }

    return categories;
  }
}
