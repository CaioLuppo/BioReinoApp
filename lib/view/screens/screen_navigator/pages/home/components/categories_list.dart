part of home_page;

class CategoriesList extends StatelessWidget {
  final List<List<Category>> lists;
  final List<Category> defaultList;
  final GlobalKey<BulletState> bulletKey;
  final PageController controller;

  const CategoriesList({
    required this.lists,
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
        itemCount: lists.length,
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
              lists[listIndex].length,
              (catIndex) => CategoryCard(lists[listIndex][catIndex], catIndex),
            ),
          );
        },
      ),
    );
  }
}
