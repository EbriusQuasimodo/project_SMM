import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class DateText extends StatelessWidget {
  final String dateText;
  final String timeText;
  const DateText({super.key, required this.dateText, required this.timeText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: Text(
        '$dateText  $timeText',
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ThemeApp.secondaryColorTextAndIcons),
      ),
    );
  }
}
