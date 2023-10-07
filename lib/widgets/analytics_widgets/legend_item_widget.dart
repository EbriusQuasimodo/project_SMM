import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class LegendItemWidget extends StatelessWidget {
  final Color? color;
  final String? text;

  const LegendItemWidget({
    super.key,
    this.color,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          text!,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: ThemeApp.secondaryColorTextAndIcons,
          ),
        )
      ],
    );
  }
}
