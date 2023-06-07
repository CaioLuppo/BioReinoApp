part of home_page;

class Bullet extends StatefulWidget {
  final List<List<Category>> adaptedList;
  final PageController pageController;

  const Bullet({
    required this.pageController,
    required this.adaptedList,
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
      children: widget.adaptedList.map(
        (c) {
          final double size =
              currentPage == widget.adaptedList.indexOf(c) ? 8 : 6;

          return InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () => setState(
              () => widget.pageController.animateToPage(
                widget.adaptedList.indexOf(c),
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
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
                color: currentPage == widget.adaptedList.indexOf(c)
                    ? fromBrightnessColor(
                        context,
                        BRColors.greenLight,
                        BRColors.greenLight.withOpacity(0.85),
                      )
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
