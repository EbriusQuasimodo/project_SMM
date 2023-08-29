import 'package:flutter/material.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/buttons/settings_button/settings_button.dart';
import 'package:project_smm/shared/ui/custom_dialogs/custom_dialog_with_two_buttons/custom_dialog_with_two_buttons.dart';
import 'package:project_smm/widgets/profile_widgets/update_version_button.dart';
import 'package:project_smm/widgets/profile_widgets/user_name_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profilePage),
        actions: [
          IconButton(
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
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
        child: Column(
          children: [
            const UserName(),
            const SizedBox(
              height: 12,
            ),
            Container(
              color: ThemeApp.dividerColor,
              height: 2,
            ),
            const SizedBox(
              height: 12,
            ),
            SettingButton(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.changePassword);
              },
              leadingPicture: 'assets/images/icons/profile/change_password.svg',
              buttonName: AppLocalizations.of(context)!.changePassword,
            ),
            const SizedBox(
              height: 6,
            ),
            SettingButton(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.changeLanguage)
                    .then((value) => setState(() {}));
              },
              leadingPicture: 'assets/images/icons/profile/change_language.svg',
              buttonName: LocalStorage.getString(AppConstants.LOCALE) == 'kk'
                  ? 'Қазақ'
                  : 'Русский',
            ),
            const SizedBox(
              height: 6,
            ),
            const UpdateVersionButton(),
          ],
        ),
      ),
    );
  }
}
