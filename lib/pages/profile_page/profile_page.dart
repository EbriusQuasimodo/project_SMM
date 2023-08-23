import 'package:flutter/material.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/buttons/settings_button/settings_button.dart';
import 'package:project_smm/widgets/profile_widgets/update_version_button.dart';
import 'package:project_smm/widgets/profile_widgets/user_name_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
        child: Column(
          children: [
            const UserName(),
            const SizedBox(height: 12,),
            const Divider(color: ThemeApp.dividerColor,height: 2,),
            const SizedBox(height: 12,),
            SettingButton(
              onTap: () {
                print('asdadkekpf');
              },
              leadingPicture: 'assets/images/icons/profile/change_password.svg',
              buttonName: 'Сменить пароль',
            ),
            const SizedBox(height: 6,),
            SettingButton(
              onTap: () {
                print('jkhjkhkjhj');
              },
              leadingPicture: 'assets/images/icons/profile/change_language.svg',
              buttonName: LocalStorage.getString(AppConstants.LOCALE) == 'kk'
                  ? 'Қазақ'
                  : 'Русский',
            ),
            const SizedBox(height: 6,),
            const UpdateVersionButton(),
          ],
        ),
      ),
    );
  }
}
