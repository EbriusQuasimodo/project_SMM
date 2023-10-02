import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ThemeApp.bodyColorTextAndIcons),
      ),
    );
  }
}
