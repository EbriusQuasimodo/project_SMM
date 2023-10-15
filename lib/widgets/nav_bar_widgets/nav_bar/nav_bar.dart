import 'package:flutter/material.dart';
import 'package:project_smm/pages/analytics_page.dart';
import 'package:project_smm/pages/favourites_page.dart';
import 'package:project_smm/pages/main_page/main_page.dart';
import 'package:project_smm/pages/profile_page.dart';
import 'package:project_smm/pages/reports_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_smm/widgets/nav_bar_widgets/ui/bottom_navigation_item.dart';

class NavBar extends StatefulWidget {
  int? selectedPage;
   NavBar({
    Key? key, required this.selectedPage,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {


  void onSelectPage(int index) {
    if (widget.selectedPage == index) return;
    setState(
      () {
        widget.selectedPage = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.selectedPage,
        children: [
          const MainPage(),
          AnalyticsPage(),
          const FavouritesPage(),
          ReportsPage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: BottomNavigationBar(
          currentIndex: widget.selectedPage!,
          type: BottomNavigationBarType.fixed,
          items: [
            bottomNavigationItem(
                AppLocalizations.of(context)!.mainPage,
                'assets/images/icons/shared/icon_main_page.svg'),
            bottomNavigationItem(
                AppLocalizations.of(context)!.analyticsPage,
                'assets/images/icons/shared/icon_analytics.svg'),
            bottomNavigationItem(
                AppLocalizations.of(context)!.favoritesPage,
                'assets/images/icons/shared/icon_favourites.svg'),
            bottomNavigationItem(
                AppLocalizations.of(context)!.reportsPage,
                'assets/images/icons/shared/icon_reports.svg'),
            bottomNavigationItem(
                AppLocalizations.of(context)!.profilePage,
                'assets/images/icons/shared/icon_profile.svg'),
          ],
          onTap: onSelectPage,
        ),
      ),
    );
  }
}
