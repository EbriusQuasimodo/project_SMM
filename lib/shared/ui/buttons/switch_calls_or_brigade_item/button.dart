import 'package:flutter/material.dart' hide Badge;
import 'package:badges/badges.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class Button extends StatelessWidget {
  final int itemsLength;
  final String buttonName;
  final String buttonIcon;
final VoidCallback onTap;
  const Button(
      {super.key,
      required this.itemsLength,
      required this.buttonName,
      required this.buttonIcon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
        child: MaterialButton(
          onPressed: () {onTap();},
          child: Row(
            children: [
              SvgPicture.asset(buttonIcon),
              const SizedBox(
                width: 8,
              ),
              Text(buttonName),
              const SizedBox(
                width: 8,
              ),
              Badge(
                badgeStyle: BadgeStyle(
                  shape: BadgeShape.square,
                  borderRadius: BorderRadius.circular(12),
                  badgeColor: ThemeApp.primaryColor,
                  padding: const EdgeInsets.only(
                      left: 6, right: 6, top: 3, bottom: 3),
                  elevation: 0,
                ),
                badgeContent: Text(
                  '${itemsLength}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: ThemeApp.whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
