import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class VersionName extends StatelessWidget {
  const VersionName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Text('Версия 1.0.0', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ThemeApp.tertiaryColorTextAndIcons),),
    );
  }
}
