import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ThemeApp.primaryColor,
            child: SvgPicture.asset('assets/images/icons/shared/person.svg'),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Минюстров Алексей Петрович',
            style: TextStyle(
                color: ThemeApp.secondaryColorTextAndIcons,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
