library courses_page;

import 'package:bioreino_mobile/controller/database/dao/categories_dao.dart';
import 'package:bioreino_mobile/controller/screens/route_handler.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/pages/courses_filter.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/updatable_drawer_mixin.dart';
import 'package:bioreino_mobile/controller/util/string_util.dart';
import 'package:bioreino_mobile/view/global_components/widgets/search_field.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  final UpdatableDrawer drawer;
  final bool showBackButton;

  const CoursesPage(this.drawer, {this.showBackButton = false, super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final TextEditingController editingController = TextEditingController();
  String category = "";

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
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24.0, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Categorias"),
                      DropdownButton(
                        hint: const Text("Qualquer"),
                        menuMaxHeight: 200,
                        items: generateCategoriesMenuList(),
                        value: category,
                        onChanged: (selected) => updateCategoryFilter(selected),
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
                child: ListView(
                  scrollDirection: orientation == Orientation.landscape
                      ? Axis.horizontal
                      : Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  children: courseListFilter(
                    filter: editingController.text,
                    categoryName: category,
                    context: context,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void updateCategoryFilter(String? selectedCategory) {
    setState(() {
      selectedCategory != null ? category = selectedCategory : category = "";
    });
  }
}
