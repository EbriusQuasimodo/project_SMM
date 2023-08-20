import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWithLeadingAndTitle extends StatelessWidget
    implements PreferredSizeWidget {
  final String titleText;
  final VoidCallback onTap;

  const AppBarWithLeadingAndTitle(
      {super.key, required this.titleText, required this.onTap});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleText,
      ),
      titleSpacing: 0,
      leading: MaterialButton(
        onPressed: () {
          onTap();
        },
        child: SvgPicture.asset('assets/images/icons/shared/arrow_back.svg'),
      ),
    );
  }
}
