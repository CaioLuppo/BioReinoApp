void organizeLists(List list, List<List> lists, int max) {
  final List sublist;
  if (list.length > max) {
    lists.add(list.sublist(0, max));
    sublist = list.sublist(max);
    if (sublist.length > max) {
      organizeLists(sublist, lists, max);
    } else {
      lists.add(sublist);
    }
  } else {
    lists.add(list);
  }
}