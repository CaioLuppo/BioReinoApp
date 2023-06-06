part of home_page;

class CategoriesSession extends StatelessWidget {
  final GlobalKey<BulletState> _bulletKey = GlobalKey();
  final _pageController = PageController();

  CategoriesSession({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: Text(
            "CATEGORIAS",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: SizedBox(
            height: 250,
            child: FutureBuilder(
              future: CoursesDAO.getCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final defaultList = snapshot.data!;
                    final List<List<Category>> lists = [];
                    organizeLists(defaultList, lists, 6);
                    return Column(
                      children: [
                        CategoriesList(
                          lists: lists,
                          defaultList: defaultList,
                          controller: _pageController,
                          bulletKey: _bulletKey,
                        ),
                        Bullet(
                          lists: lists,
                          pageController: _pageController,
                          key: _bulletKey,
                        ),
                      ],
                    );
                  }
                  return const EmptyList("Nenhuma categoria disponível");
                }
                return const LoadingBar();
              },
            ),
          ),
        ),
      ],
    );
  }
}
