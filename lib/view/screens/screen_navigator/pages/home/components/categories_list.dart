part of home_page;

class CategoriesList extends StatelessWidget {
  /// Lista adaptada
  final List<List<Category>> adaptedList;
  final List<Category> defaultList;
  final GlobalKey<BulletState> bulletKey;
  final PageController controller;

  const CategoriesList({
    required this.adaptedList,
    required this.defaultList,
    required this.controller,
    required this.bulletKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        itemCount: adaptedList.length,
        onPageChanged: (index) => bulletKey.currentState?.update(index),
        itemBuilder: (context, listIndex) {
          return GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            crossAxisCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 3
                    : 5,
            shrinkWrap: true,
            children: List.generate(
              adaptedList[listIndex].length,
              (catIndex) {
                final Category category = adaptedList[listIndex][catIndex];
                return CategoryCard(category, defaultList.indexOf(category));
              },
            ),
          );
        },
      ),
    );
  }
}
