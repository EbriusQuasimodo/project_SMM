import 'package:flutter/material.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/ui/buttons/settings_button/settings_button.dart';
import 'package:project_smm/widgets/profile_widgets/update_version_button.dart';
import 'package:project_smm/widgets/profile_widgets/user_name_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            const UserName(),
            const Divider(),
            SettingButton(
              onTap: () {
                print('asdadkekpf');
              },
              leadingIcon: Icons.safety_check,
              actionIcon: Icons.arrow_forward_ios,
              buttonName: 'Сменить пароль',
            ),
            SettingButton(
              onTap: () {
                print('jkhjkhkjhj');
              },
              leadingIcon: Icons.language,
              actionIcon: Icons.arrow_forward_ios,
              buttonName: LocalStorage.getString(AppConstants.LOCALE) == 'kk'
                  ? 'kazak'
                  : 'русский',
            ),
            const UpdateVersionButton(),
          ],
        ),
      ),
    );
  }
}
