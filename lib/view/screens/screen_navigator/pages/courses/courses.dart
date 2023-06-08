library courses_page;

import 'package:bioreino_mobile/controller/screens/route_handler.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/pages/courses_filter.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/updatable_drawer_mixin.dart';
import 'package:bioreino_mobile/view/global_components/widgets/search_field.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/pages/home/home.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  final UpdatableDrawer drawer;
  final bool showBackButton;
  static String categoryName = "";

  const CoursesPage(
    this.drawer, {
    this.showBackButton = false,
    super.key,
  });

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return widget.showBackButton
        ? Scaffold(
            appBar: BRAppBar(drawer: widget.drawer),
            body: _buildBody(context),
          )
        : BasePage(
            widget.drawer,
            body: _buildBody(context),
          );
  }

  Widget _buildBody(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    final list = courseListFilter(
      filter: editingController.text,
      categoryName: CoursesPage.categoryName,
      context: context,
    );
    return WillPopScope(
      onWillPop: () => exitPage(
        widget.showBackButton,
        widget.drawer,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SearchField(
                    controller: editingController,
                    onChanged: setState,
                  ),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Categorias",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        height: 32,
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(color: BRColors.greyText)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              underline: null,
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(10),
                              style: Theme.of(context).textTheme.bodyMedium,
                              hint: const Text(
                                "Qualquer",
                              ),
                              menuMaxHeight: 200,
                              items: generateCategoriesMenuList(context),
                              value: CoursesPage.categoryName,
                              onChanged: (selected) =>
                                  updateCategoryFilter(selected),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: orientation == Orientation.landscape
                  ? const EdgeInsets.fromLTRB(16, 8, 16, 16)
                  : const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: list.isNotEmpty
                    ? ListView(
                        scrollDirection: orientation == Orientation.landscape
                            ? Axis.horizontal
                            : Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        children: list,
                      )
                    : const EmptyList("Não há cursos correspondentes."),
              ),
            ),
          )
        ],
      ),
    );
  }

  void updateCategoryFilter(String? selectedCategory) {
    setState(() {
      selectedCategory != null
          ? CoursesPage.categoryName = selectedCategory
          : CoursesPage.categoryName = "";
    });
  }
}
