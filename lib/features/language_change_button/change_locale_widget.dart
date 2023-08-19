import 'package:flutter/material.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/language/app_locale_model.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/buttons/choice_button/choice_button.dart';
import 'package:provider/provider.dart';

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
                color: ThemeApp.lightBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              height: 48,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                        child: ChoiceButton(
                    onTap: () {
                        localeModel.setLocale(context, Locale('kk'));
                        LocalStorage.setString(AppConstants.LOCALE, 'kk');
                    },
                    buttonName: 'KZ',
                    buttonColor: selectedLocale == 'ru'
                          ? ThemeApp.lightBackgroundColor
                          : ThemeApp.darkBackgroundColor,
                    buttonIconPath: 'assets/images/icons/auth/kz_flag.svg',
                  ),
                      )),
                  Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                        child: ChoiceButton(
                    onTap: () {
                        localeModel.setLocale(context, Locale('ru'));
                        LocalStorage.setString(AppConstants.LOCALE, 'ru');
                    },
                    buttonName: 'RU',
                    buttonColor: selectedLocale == 'ru'
                          ? ThemeApp.darkBackgroundColor
                          : ThemeApp.lightBackgroundColor,
                    buttonIconPath: 'assets/images/icons/auth/rus_flag.svg',
                  ),
                      )),
                ],
              ),
            ));
  }
}
