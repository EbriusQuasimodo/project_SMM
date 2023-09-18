import 'package:flutter/material.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/custom_dialogs/custom_dialog_with_two_buttons/custom_dialog_with_two_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (builder) => CustomDialogWithTwoButtons(
            title: AppLocalizations.of(context)!.signOut,
            onTapFirstButton: () {
              Navigator.of(context).pop();
            },
            onTapSecondButton: () {
              Navigator.of(context).pushNamed(AppRoutes.auth);
              LocalStorage.setString(AppConstants.TOKEN, '');
            },
          ),
        );
      },
      icon: const Icon(
        Icons.exit_to_app,
        color: ThemeApp.secondaryColorTextAndIcons,
      ),
    );
  }
}
