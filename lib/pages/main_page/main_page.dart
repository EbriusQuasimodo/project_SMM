import 'package:flutter/material.dart';
import 'package:project_smm/app/nav_bar/nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(
        'главная страница',
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
    ),
    bottomNavigationBar: NavBar(),
    );
  }
}
