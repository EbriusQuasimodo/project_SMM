import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChoiceRegionButton extends StatelessWidget {
  const ChoiceRegionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: MaterialButton(
        onPressed: () {
          
        },
        color: ThemeApp.whiteColor,
        height: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
              color: ThemeApp.secondaryColorTextAndIcons),
        ),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.choiceRegion,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeApp.secondaryColorTextAndIcons),
            ),
            const Icon(Icons.keyboard_arrow_down,
              color: ThemeApp.secondaryColorTextAndIcons,),
          ],
        ),
      ),
    );
  }
}
