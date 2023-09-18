import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class ShowMoreButton extends StatelessWidget {
  final VoidCallback onTap;

  const ShowMoreButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      child: const Text(
        'показать все',
        style: TextStyle(color: ThemeApp.primaryColor),
      ),
    );
  }
}
