class Category {
  final String name;
  final String plan;

  Category(Map<String, dynamic> map)
      : name = map["name"],
        plan = map["plan"];
}
