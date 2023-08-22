import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

BottomNavigationBarItem bottomNavigationItem (String labelText, String iconPath){
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SvgPicture.asset(
          iconPath),
    ),
    label: labelText,
    activeIcon: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SvgPicture.asset(
        iconPath,
        color: ThemeApp.primaryColor,
      ),
    ),
  );
}
