void organizeLists(List list, List<List> adaptedList, int max) {
  final List sublist;
  if (list.length > max) {
    adaptedList.add(list.sublist(0, max));
    sublist = list.sublist(max);
    if (sublist.length > max) {
      organizeLists(sublist, adaptedList, max);
    } else {
      adaptedList.add(sublist);
    }
  } else {
    adaptedList.add(list);
  }
}
