import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_smm/entities/auth_entities/auth_bloc/auth_bloc.dart';
import 'package:project_smm/entities/filter_entities/filter_bloc/filters_bloc.dart';
import 'package:project_smm/entities/main_page_entities/main_page_bloc/main_page_bloc.dart';
import 'package:project_smm/pages/analytics_page.dart';
import 'package:project_smm/pages/change_language_page.dart';
import 'package:project_smm/pages/change_password_page.dart';
import 'package:project_smm/pages/choice_region_page.dart';
import 'package:project_smm/pages/favourites_page.dart';
import 'package:project_smm/pages/filter_page/filter_choice_chip_page.dart';
import 'package:project_smm/pages/home_page.dart';
import 'package:project_smm/pages/login_page.dart';
import 'package:project_smm/pages/main_page.dart';
import 'package:project_smm/pages/profile_page.dart';
import 'package:project_smm/pages/region_list_page.dart';
import 'package:project_smm/pages/reports_page.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/language/app_locale_model.dart';

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
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedLabelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ThemeApp.secondaryColorTextAndIcons),
              selectedItemColor: ThemeApp.secondaryColorTextAndIcons,
              unselectedItemColor: ThemeApp.tertiaryColorTextAndIcons,
              unselectedLabelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ThemeApp.tertiaryColorTextAndIcons),
              selectedIconTheme: IconThemeData(
                color: ThemeApp.primaryColor,
              ),
              unselectedIconTheme: IconThemeData(
                color: ThemeApp.tertiaryColorTextAndIcons,
              ),
              backgroundColor: ThemeApp.backgroundColorOne,
            ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: LocalStorage.getString(AppConstants.LOCALE) != ''
              ? Locale(LocalStorage.getString(AppConstants.LOCALE))
              : Locale(localeModel.locale.languageCode),
          initialRoute: LocalStorage.getString(AppConstants.TOKEN) != '' &&
                  LocalStorage.getString(AppConstants.REGION) != ''
              ? AppRoutes.homePage
              : LocalStorage.getString(AppConstants.REGION) != ''
                  ? AppRoutes.auth
                  : AppRoutes.choiceRegion,
          routes: {
            AppRoutes.auth: (context) => Provider(
                create: (context) => AuthBloc(), child: const LoginPage()),
            AppRoutes.homePage: (context) => HomePage(),
            AppRoutes.mainPage: (context) => const MainPage(),
            AppRoutes.choiceRegion: (context) => const ChoiceRegionPage(),
            AppRoutes.regionList: (context) => const RegionListPage(),
            AppRoutes.analytics: (context) => AnalyticsPage(),
            AppRoutes.favorites: (context) => const FavouritesPage(),
            AppRoutes.reports: (context) => ReportsPage(),
            AppRoutes.profile: (context) => const ProfilePage(),
            AppRoutes.changeLanguage: (context) => const ChangeLanguagePage(),
            AppRoutes.changePassword: (context) => ChangePasswordPage(),
          },
        ),
      ),
    );
  }
}
