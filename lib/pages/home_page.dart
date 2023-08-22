import 'package:flutter/material.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/widgets/nav_bar_widgets/nav_bar/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.auth);
                LocalStorage.setString(AppConstants.TOKEN, '');
              },
              icon: const Icon(Icons.exit_to_app, color: ThemeApp.secondaryColorTextAndIcons,))
        ],
      ),
      body: const NavBar(),
    );
  }
}
