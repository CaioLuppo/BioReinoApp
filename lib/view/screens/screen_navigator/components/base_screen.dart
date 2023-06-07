part of screen_navigator;

class BasePage extends StatelessWidget {
  final UpdatableDrawer drawer;
  final Widget body;
  const BasePage(this.drawer, {required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BRAppBar(),
      drawerEnableOpenDragGesture: false,
      drawer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BRDrawer(context, drawer),
      ),
      body: body,
    );
  }
}
