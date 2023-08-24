import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class SettingButton extends StatelessWidget {
  final VoidCallback onTap;
  final String leadingPicture;
final String buttonName;
  const SettingButton({super.key, required this.onTap, required this.leadingPicture, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      height: 44,
      onPressed: () {
        onTap();
      },
      //color: Colors.transparent,
      elevation: 0,
      child: Row(
        children: [
          SvgPicture.asset(leadingPicture),
          const SizedBox(width: 12,),
          Text(buttonName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ThemeApp.secondaryColorTextAndIcons),),
          const Spacer(),
          SvgPicture.asset('assets/images/icons/shared/arrow.svg'),
        ],
      ),
    );
  }
}
