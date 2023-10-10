import 'package:flutter/material.dart';
import 'package:project_smm/widgets/nav_bar_widgets/nav_bar/nav_bar.dart';

class HomePage extends StatelessWidget {
  int? selectedPage;
  HomePage({super.key, this.selectedPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavBar(selectedPage: selectedPage ?? 0,),
    );
  }
}
