import 'package:flutter/material.dart';
import 'package:project_smm/features/change_password/bloc/change_password_bloc.dart';
import 'package:project_smm/features/change_password/ui/change_password_widget.dart';
import 'package:project_smm/shared/ui/app_bars/app_bar_with_leading_and_title/app_bar_with_leading_and_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatelessWidget {
   const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithLeadingAndTitle(
          titleText: AppLocalizations.of(context)!.changePassword,
          onTap: () {
            Navigator.of(context).pop();
          }),
      body: Provider(
          create: (context) => ChangePasswordBloc(), child: ChangePasswordWidget()),
    );
  }
}
