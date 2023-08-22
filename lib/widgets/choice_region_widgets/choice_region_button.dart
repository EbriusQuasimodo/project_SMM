import 'package:flutter/material.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChoiceRegionButton extends StatefulWidget {
  const ChoiceRegionButton({super.key});

  @override
  State<ChoiceRegionButton> createState() => _ChoiceRegionButtonState();
}

class _ChoiceRegionButtonState extends State<ChoiceRegionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.regionList)
              .then((value) => setState(() {}));
        },
        color: ThemeApp.whiteColor,
        height: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: ThemeApp.secondaryColorTextAndIcons),
        ),
        elevation: 0,
        child: Row(
          children: [
            Text(
              AppLocalizations.of(context)!.choiceRegion,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeApp.secondaryColorTextAndIcons),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              LocalStorage.getString(AppConstants.REGION) != ''
                  ? '(${LocalStorage.getString(AppConstants.REGION)})'
                  : '(регион не выбран)',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeApp.tertiaryColorTextAndIcons),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_down,
              color: ThemeApp.secondaryColorTextAndIcons,
            ),
          ],
        ),
      ),
    );
  }
}
