part of home_page;

class CategoryCard extends StatelessWidget {
  final Category category;
  final int _index;
  int get index {
    final indexString = _index.toString();
    if (indexString.length > 1) {
      return int.parse(indexString.substring(indexString.length - 1));
    }
    return _index;
  }

  static final List<Color> _colorsList = [
    BRColors.green,
    BRColors.yellow,
    BRColors.blue,
    BRColors.orangeRed,
    BRColors.blueGreen,
    BRColors.greenDark,
    BRColors.greenYellow,
    BRColors.greenLight,
    BRColors.orange,
    BRColors.greenLightBlue,
  ];

  const CategoryCard(this.category, this._index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _colorsList[index],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(8),
      elevation: 5,
      child: Center(
        child: Text(
          category.name.toUpperCase(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
