import 'package:flutter/material.dart';
import 'package:project_smm/features/language_change_button/change_locale_widget.dart';
import 'package:project_smm/shared/ui/app_bar_items/app_bar_with_leading_and_title/app_bar_with_leading_and_title.dart';

class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithLeadingAndTitle(titleText: 'Смена языка', onTap: (){Navigator.of(context).pop();}),
      body: const Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: ChangeLocaleWidget(),
      ),
    );
  }
}
