import 'package:flutter/material.dart';
import 'package:project_smm/app/constants/theme_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        AppLocalizations.of(context)!.authorization,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: ThemeApp.secondaryColorTextAndIcons,
        ),
      ),
      Text(
        AppLocalizations.of(context)!.welcome,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: ThemeApp.secondaryColorTextAndIcons,
        ),
      ),
    ],);
  }
}
