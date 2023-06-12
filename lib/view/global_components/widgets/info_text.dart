import 'package:bioreino_mobile/controller/util/theme_util.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String label;
  final String value;
  final TextTheme theme;
  final bool wrap;
  const InfoText(this.theme, this.label, this.value,
      {this.wrap = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: _buildBody(
        wrap,
        [
          Text(
            label,
            style: theme.bodyLarge?.copyWith(
              color: fromBrightnessColor(context, Colors.black, Colors.white),
            ),
          ),
          Text(
            value,
            style: theme.bodyLarge?.copyWith(color: BRColors.greyText),
          )
        ],
      ),
    );
  }

  Widget _buildBody(bool wrap, List<Widget> children) {
    return wrap
        ? Wrap(
            alignment: WrapAlignment.start,
            children: children,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          );
  }
}
