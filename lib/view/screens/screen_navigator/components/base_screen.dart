part of screen_navigator;

class BasePage extends StatelessWidget {
  final UpdatableDrawer drawer;
  final bool scrollElevation;
  final Widget body;
  const BasePage(this.drawer, {required this.body, this.scrollElevation = false,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BRAppBar(
        leading: const HamburguerMenu(),
        scroolElevation: scrollElevation,
      ),
      drawerEnableOpenDragGesture: false,
      drawer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BRDrawer(context, drawer),
      ),
      body: MediaQuery.of(context).orientation == Orientation.landscape
          ? body
          : SafeArea(
              child: body,
            ),
    );
  }
}
