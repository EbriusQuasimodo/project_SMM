import 'package:flutter/material.dart';
import 'package:project_smm/pages/analytics_page/analytics_page.dart';
import 'package:project_smm/pages/favorites_page/favorites_page.dart';
import 'package:project_smm/pages/main_page/main_page.dart';
import 'package:project_smm/pages/profile_page/profile_page.dart';
import 'package:project_smm/pages/reports_page/reports_page.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies_sharp),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Аналитика',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies_sharp),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Отчеты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies_sharp),
            label: 'Профиль',
          ),

        ],
        onTap: onSelectPage,
      ),
    );
  }
}