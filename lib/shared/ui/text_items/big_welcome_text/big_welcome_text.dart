import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class BigWelcomeText extends StatelessWidget {
  final String text;
  const BigWelcomeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: ThemeApp.primaryColor),
    );
  }
}
