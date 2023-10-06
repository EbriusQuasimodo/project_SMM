import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class StatusCard extends StatelessWidget {
  final String statusName;
  final Color statusColor;
  const StatusCard({super.key, required this.statusName, required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 24,
      decoration: BoxDecoration(
          color: statusColor, borderRadius: BorderRadius.circular(8)),
      child: Text(
        statusName,
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ThemeApp.whiteColor),
      ),
    );
  }
}
