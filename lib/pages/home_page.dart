import 'package:flutter/material.dart';
import 'package:project_smm/widgets/nav_bar_widgets/nav_bar/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NavBar(),
    );
  }
}
