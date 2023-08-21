import 'package:flutter/material.dart';
import 'package:project_smm/app/nav_bar/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavBar(),
    );
  }
}
