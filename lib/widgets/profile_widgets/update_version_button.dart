import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class UpdateVersionButton extends StatelessWidget {
  const UpdateVersionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      elevation: 0,
      color: Colors.transparent,
      child: const Row(
        children: [
          Icon(Icons.download),
          Column(
            children: [
              Text(
                'Обновить версию',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ThemeApp.secondaryColorTextAndIcons),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Текущая версия 1.0.0',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ThemeApp.tertiaryColorTextAndIcons),
              )
            ],
          )
        ],
      ),
    );
  }
}
