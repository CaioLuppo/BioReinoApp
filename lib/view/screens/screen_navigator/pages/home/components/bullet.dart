part of home_page;

class Bullet extends StatefulWidget {
  final List<List<Category>> lists;
  final PageController pageController;

  const Bullet({
    required this.pageController,
    required this.lists,
    super.key,
  });

  @override
  State<Bullet> createState() => BulletState();
}

class BulletState extends State<Bullet> {
  int currentPage = 0;

  void update(int index) {
    setState(() => currentPage = index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.lists.map(
        (c) {
          final double size = currentPage == widget.lists.indexOf(c) ? 10 : 8;

          return InkWell(
            onTap: () => setState(
              () => widget.pageController.jumpToPage(
                widget.lists.indexOf(c),
              ),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.all(8),
              curve: Curves.easeOut,
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: currentPage == widget.lists.indexOf(c)
                    ? BRColors.greenLightBlue
                    : fromBrightnessColor(
                        context,
                        Colors.black12,
                        Colors.white12,
                      ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
