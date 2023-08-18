import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_smm/entities/auth_entities/auth_bloc/auth_bloc.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/language/app_locale_model.dart';
import 'package:project_smm/pages/auth_page/auth_page.dart';
import 'package:project_smm/pages/main_page/main_page.dart';

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
          locale: LocalStorage.getString(AppConstants.LOCALE) != ''
              ? Locale(LocalStorage.getString(AppConstants.LOCALE))
              : Locale(localeModel.locale.languageCode),
          initialRoute: LocalStorage.getString(AppConstants.TOKEN) != '' ? AppRoutes.mainPage :AppRoutes.auth,
          routes: {
            AppRoutes.mainPage: (context) => const MainPage(),
            AppRoutes.auth: (context) =>
                Provider(create: (context) => AuthBloc(), child: const AuthPage()),
          },
        ),
      ),
    );
  }
}
