import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class SettingButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData leadingIcon;
  final IconData actionIcon;
final String buttonName;
  const SettingButton({super.key, required this.onTap, required this.leadingIcon, required this.actionIcon, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onTap();
      },
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        children: [
          Icon(leadingIcon, color: ThemeApp.tertiaryColorTextAndIcons,),
          Text(buttonName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ThemeApp.secondaryColorTextAndIcons),),
          const Spacer(),
          Icon(actionIcon, color: ThemeApp.tertiaryColorTextAndIcons,),
        ],
      ),
    );
  }
}
