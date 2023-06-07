library courses_page;

import 'package:bioreino_mobile/controller/screens/screen_navigator/pages/courses_filter.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/pages_enum.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/updatable_drawer_mixin.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoursesPage extends StatefulWidget {
  final UpdatableDrawer drawer;
  final bool showBackButton;

  const CoursesPage(this.drawer, {this.showBackButton = false, super.key});

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
    return WillPopScope(
      onWillPop: () {
        if (widget.showBackButton) {
          widget.drawer.updatePage(Pages.home);
          return true as Future<bool>;
        }
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true as Future<bool>;
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              onChanged: (_) => setState(() {}),
              controller: editingController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  hintText: "Search",
                  suffixIcon: Icon(
                    Icons.search,
                    color: BRColors.greyText,
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ListView(
                padding: orientation == Orientation.landscape
                    ? const EdgeInsets.all(16)
                    : const EdgeInsets.all(24),
                scrollDirection: orientation == Orientation.landscape
                    ? Axis.horizontal
                    : Axis.vertical,
                physics: const BouncingScrollPhysics(),
                children: courseFilter(editingController.text, context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
