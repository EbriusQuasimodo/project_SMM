import 'package:flutter/material.dart';
import 'package:project_smm/entities/constants.dart';
import 'package:project_smm/app/local_storage.dart';
import 'package:project_smm/features/change_app_locale_feature/app_locale_model.dart';
import 'package:provider/provider.dart';

class ChangeLocaleWidget extends StatelessWidget {
  const ChangeLocaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedLocale = Localizations.localeOf(context).toString();
    return Consumer<LocaleModel>(
      builder: (context, localeModel, child) => DropdownButton(
        padding: const EdgeInsets.only(top: 10),
        icon: const Icon(Icons.language),
        underline: const SizedBox(),
        value: selectedLocale,
        items: const [
          DropdownMenuItem(
            value: "ru",
            child: Text('Рус'),
          ),
          DropdownMenuItem(
            value: "kk",
            child: Text('Қаз'),
          ),
        ],
        onChanged: (String? value) {
          if (value != null) {
            localeModel.setLocale(context, Locale(value));
            LocalStorage.setString(AppConstants.LOCALE, value);
          }
        },
      ),
    );
  }
}
