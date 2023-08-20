import 'package:flutter/material.dart';
import 'package:project_smm/features/language_change_button/change_locale_widget.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/ui/buttons/primary_button/primary_button.dart';
import 'package:project_smm/shared/ui/text_items/big_welcome_text/big_welcome_text.dart';
import 'package:project_smm/shared/ui/text_items/version_name/version_name.dart';
import 'package:project_smm/widgets/choice_region_widgets/canvas_logo.dart';
import 'package:project_smm/widgets/choice_region_widgets/choice_region_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChoiceRegionWidget extends StatelessWidget {
  const ChoiceRegionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CanvasLogoPictureWidget(),
            BigWelcomeText(text: AppLocalizations.of(context)!.welcome),
            const SizedBox(
              height: 24,
            ),
            const ChangeLocaleWidget(),
            const SizedBox(
              height: 12,
            ),
            const ChoiceRegionButton(),
            const SizedBox(
              height: 12,
            ),
            PrimaryButton(
                onTap: () {
                  if (LocalStorage.getInt(AppConstants.REGIONINDEX) != -1 &&
                      LocalStorage.getString(AppConstants.REGION) != '') {
                    Navigator.of(context).pushNamed(AppRoutes.auth);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Не выбран регион'),
                      ),
                    );
                  }
                },
                buttonName: AppLocalizations.of(context)!.signInApp),
            const Spacer(),
            const VersionName(),
          ],
        ),
      ),
    );
  }
}
