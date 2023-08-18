import 'package:flutter/material.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/language/app_locale_model.dart';
import 'package:provider/provider.dart';

class ChangeLocaleWidget extends StatelessWidget {
  const ChangeLocaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedLocale = Localizations.localeOf(context).toString();
    return Consumer<LocaleModel>(
      builder: (context, localeModel, child) => DropdownButton(
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
            child: Text('Қазақ'),
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
