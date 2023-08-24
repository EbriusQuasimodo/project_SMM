import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class UpdateVersionButton extends StatelessWidget {
  const UpdateVersionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      height: 44,
      onPressed: () {},
      elevation: 0,
     // color: Colors.transparent,
      child: Row(
        children: [
          SvgPicture.asset('assets/images/icons/profile/update_version.svg'),
          const SizedBox(width: 12,),
          const Column(
            children: [
              Text(
                'Обновить версию',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ThemeApp.secondaryColorTextAndIcons),
              ),
              Text(
                'Текущая версия 1.0.0',
                style: TextStyle(
                    fontSize: 14,
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
