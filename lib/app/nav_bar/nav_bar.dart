import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/pages/analytics_page/analytics_page.dart';
import 'package:project_smm/pages/favorites_page/favorites_page.dart';
import 'package:project_smm/pages/main_page/main_page.dart';
import 'package:project_smm/pages/profile_page/profile_page.dart';
import 'package:project_smm/pages/reports_page/reports_page.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedPage = 0;

  void onSelectPage(int index) {
    if (_selectedPage == index) return;
    setState(
      () {
        _selectedPage = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedPage,
        children: const [
          MainPage(),
          AnalyticsPage(),
          FavoritesPage(),
          ReportsPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: BottomNavigationBar(
          currentIndex: _selectedPage,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                    'assets/images/icons/shared/icon_main_page.svg'),
              ),
              label: AppLocalizations.of(context)!.mainPage,
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                  'assets/images/icons/shared/icon_main_page.svg',
                  color: ThemeApp.primaryColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                    'assets/images/icons/shared/icon_analytics.svg'),
              ),
              label: AppLocalizations.of(context)!.analyticsPage,
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                  'assets/images/icons/shared/icon_analytics.svg',
                  color: ThemeApp.primaryColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                    'assets/images/icons/shared/icon_favorites.svg'),
              ),
              label: AppLocalizations.of(context)!.favoritesPage,
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                  'assets/images/icons/shared/icon_favorites.svg',
                  color: ThemeApp.primaryColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                    'assets/images/icons/shared/icon_reports.svg'),
              ),
              label: AppLocalizations.of(context)!.reportsPage,
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                  'assets/images/icons/shared/icon_reports.svg',
                  color: ThemeApp.primaryColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                    'assets/images/icons/shared/icon_profile.svg'),
              ),
              label: AppLocalizations.of(context)!.profilePage,
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                  'assets/images/icons/shared/icon_profile.svg',
                  color: ThemeApp.primaryColor,
                ),
              ),
            ),
          ],
          onTap: onSelectPage,
        ),
      ),
    );
  }
}
