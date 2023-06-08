import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final void Function(void Function()) onChanged;
  final TextEditingController controller;

  const SearchField({
    required this.controller,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: TextField(
        onChanged: (_) => onChanged(() {}),
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          hintText: "Procurar",
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          suffixIcon: Icon(
            Icons.search,
            color: BRColors.greyText,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
