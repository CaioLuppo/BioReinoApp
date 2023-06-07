import 'package:bioreino_mobile/controller/database/dao/categories_dao.dart';
import 'package:bioreino_mobile/model/category.dart';

void organizeLists(
    List<Category> list, List<List<Category>> adaptedList, int max) {
  List<Category> sublist;
  bool abort = false;
  for (var elementList in adaptedList) {
    for (var element in elementList) {
      abort = CategoriesDAO.categories.contains(element);
    }
  }
  if (abort) return;
  if (list.length > max) {
    adaptedList.add(list.sublist(0, max));
    sublist = list.sublist(max);
    while (sublist.length > max) {
      adaptedList.add(sublist.sublist(0, max + 1));
      sublist = sublist.sublist(max);
    }
    if (sublist.isNotEmpty) adaptedList.add(sublist);
  } else {
    adaptedList.add(list);
  }
}
