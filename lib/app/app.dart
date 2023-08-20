import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_smm/entities/auth_entities/auth_bloc/auth_bloc.dart';
import 'package:project_smm/pages/choice_region_page/choice_region_page.dart';
import 'package:project_smm/pages/region_list_page/region_list_page.dart';
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
              backgroundColor: ThemeApp.elevationColorOne,
              elevation: 0,
            ),
            scaffoldBackgroundColor: ThemeApp.whiteColor,
            cardTheme: const CardTheme().copyWith(
              color: ThemeApp.elevationColorOne,
            ),
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: ThemeApp.backgroundColorOne,
              titleTextStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: ThemeApp.secondaryColorTextAndIcons,
              ),
            ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: LocalStorage.getString(AppConstants.LOCALE) != ''
              ? Locale(LocalStorage.getString(AppConstants.LOCALE))
              : Locale(localeModel.locale.languageCode),
          initialRoute: LocalStorage.getString(AppConstants.TOKEN) != '' &&
                  LocalStorage.getString(AppConstants.REGION) != ''
              ? AppRoutes.mainPage
              : LocalStorage.getString(AppConstants.REGION) != ''
                  ? AppRoutes.auth
                  : AppRoutes.choiceRegion,
          routes: {
            AppRoutes.mainPage: (context) => const MainPage(),
            AppRoutes.auth: (context) => Provider(
                create: (context) => AuthBloc(), child: const AuthPage()),
            AppRoutes.choiceRegion: (context) => const ChoiceRegionPage(),
            AppRoutes.regionList : (context) => const RegionListPage(),
          },
        ),
      ),
    );
  }
}
