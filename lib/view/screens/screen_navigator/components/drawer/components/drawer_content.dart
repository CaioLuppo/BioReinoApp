part of drawer;

class DrawerContent extends ListTile {
  static int selectedIndex = 0;

  DrawerContent(
    UpdatableDrawer updatableDrawer,
    BuildContext context, {
    super.key,
    required String text,
    required String leadingSvgPath,
    required Pages page,
    required int index,
  }) : super(
            onTap: () {
              drawerOnTap(updatableDrawer, page, context);
              selectedIndex = index;
            },
            minLeadingWidth: 0,
            leading: ColorFiltered(
              colorFilter: ColorFilter.mode(
                selectedIndex == index ? BRColors.green : BRColors.greyText,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                width: 28,
                leadingSvgPath,
                height: 28,
                alignment: Alignment.center,
              ),
            ),
            title: DrawerText(
              text,
              context,
              uppercase: false,
              fontWeight:
                  selectedIndex == index ? FontWeight.w600 : FontWeight.normal,
            ),
            selected: selectedIndex == index,
            selectedTileColor: BRColors.greenLight.withAlpha(20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8 * 1.06),
      child: super.build(context),
    );
  }
}
