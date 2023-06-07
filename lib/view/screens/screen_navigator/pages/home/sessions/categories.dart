part of home_page;

class CategoriesSession extends StatelessWidget {
  final GlobalKey<BulletState> _bulletKey = GlobalKey();
  final _pageController = PageController();
  static final List<List<Category>> adaptedList = [];

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
              future: CategoriesDAO.getCategories(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    organizeLists(CategoriesDAO.categories, adaptedList, 6);
                    return Column(
                      children: [
                        CategoriesList(
                          adaptedList: adaptedList,
                          controller: _pageController,
                          bulletKey: _bulletKey,
                        ),
                        Bullet(
                          adaptedList: adaptedList,
                          pageController: _pageController,
                          key: _bulletKey,
                        ),
                      ],
                    );
                  }
                  return const EmptyList(
                    "Nenhuma categoria disponível.",
                  );
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return const EmptyList(
                    "Houve um erro. Por favor, reinicie o app.",
                  );
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
