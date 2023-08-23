import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          backgroundColor: ThemeApp.primaryColor,
          child: Icon(Icons.person),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Минюстров Алексей Петрович',
          style: TextStyle(
              color: ThemeApp.secondaryColorTextAndIcons,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
