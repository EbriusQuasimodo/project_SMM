import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_smm/app/constants/theme_app.dart';
import 'package:project_smm/entities/constants.dart';
import 'package:project_smm/entities/local_storage.dart';
import 'package:project_smm/features/change_app_locale_feature/app_locale_model.dart';
import 'package:project_smm/pages/auth_page/auth_page.dart';

import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleModel(),
      child: Consumer<LocaleModel>(
        builder: (context, localeModel, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            floatingActionButtonTheme:
                const FloatingActionButtonThemeData().copyWith(
              backgroundColor: ThemeApp.darkBackgroundColor,
              elevation: 0,
            ),
            scaffoldBackgroundColor: ThemeApp.whiteColor,
            cardTheme: const CardTheme().copyWith(
              color: ThemeApp.darkBackgroundColor,
            ),
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: ThemeApp.darkBackgroundColor,
              elevation: 0,
              titleTextStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: ThemeApp.secondaryColorTextAndIcons,
              ),
            ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: LocalStorage.getString(AppConstants.LOCALE) != '' ? Locale(LocalStorage.getString(AppConstants.LOCALE)) : Locale(localeModel.locale.languageCode),
          home: const AuthPage(),
        ),
      ),
    );
  }
}
