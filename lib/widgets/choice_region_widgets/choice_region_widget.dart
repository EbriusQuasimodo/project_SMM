import 'package:flutter/material.dart';
import 'package:project_smm/features/language_change_button/change_locale_widget.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/buttons/primary_button/primary_button.dart';
import 'package:project_smm/shared/ui/text_item/version_name/version_name.dart';
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
             Text(
              AppLocalizations.of(context)!.welcome,
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: ThemeApp.primaryColor),
            ),
            const SizedBox(height: 24,),
            const ChangeLocaleWidget(),
            const SizedBox(height: 12,),
            const ChoiceRegionButton(),
            const SizedBox(height: 12,),
            PrimaryButton(onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.auth, (route) => false);
            }, buttonName: AppLocalizations.of(context)!.signInApp),
            const Spacer(),
            const VersionName(),
          ],
        ),
      ),
    );
  }
}
