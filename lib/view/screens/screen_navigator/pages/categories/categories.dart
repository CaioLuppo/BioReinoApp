import 'package:bioreino_mobile/controller/screens/screen_navigator/updatable_drawer_mixin.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  final UpdatableDrawer drawer;
  final bool showBackButton;

  const CategoriesPage({
    super.key,
    required this.drawer,
    required this.showBackButton,
  });

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
