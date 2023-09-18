import 'package:flutter/material.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/language/app_locale_model.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:provider/provider.dart';

import 'ui/choice_button/choice_button.dart';

class ChangeLocaleWidget extends StatefulWidget {
  const ChangeLocaleWidget({Key? key}) : super(key: key);

  @override
  State<ChangeLocaleWidget> createState() => _ChangeLocaleWidgetState();
}

class _ChangeLocaleWidgetState extends State<ChangeLocaleWidget> {

  @override
  Widget build(BuildContext context) {
    var selectedLocale = Localizations.localeOf(context).toString();
    return Consumer<LocaleModel>(
        builder: (context, localeModel, child) => Container(
              decoration: const BoxDecoration(
                color: ThemeApp.surfaceColorTwo,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              height: 48,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                        child: ChoiceButton(
                    onTap: () {
                        localeModel.setLocale(context, const Locale('kk'));
                        LocalStorage.setString(AppConstants.LOCALE, 'kk');
                    },
                    buttonName: 'KZ',
                    buttonColor: selectedLocale == 'ru'
                          ? ThemeApp.surfaceColorTwo
                          : ThemeApp.elevationColorOne,
                    buttonIconPath: 'assets/images/icons/auth/kz_flag.svg',
                  ),
                      )),
                  Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                        child: ChoiceButton(
                    onTap: () {
                        localeModel.setLocale(context, const Locale('ru'));
                        LocalStorage.setString(AppConstants.LOCALE, 'ru');
                    },
                    buttonName: 'RU',
                    buttonColor: selectedLocale == 'ru'
                          ? ThemeApp.elevationColorOne
                          : ThemeApp.surfaceColorTwo,
                    buttonIconPath: 'assets/images/icons/auth/rus_flag.svg',
                  ),
                      )),
                ],
              ),
            ));
  }
}
