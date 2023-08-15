import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_smm/app/constants/theme_app.dart';
import 'package:project_smm/features/auth_feature/auth_bloc/auth_bloc.dart';

class AuthButtonWidget extends StatelessWidget {
  final String login;
  final String password;
  final GlobalKey<FormState> formKey;
  const AuthButtonWidget({Key? key, required this.login, required this.password, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(right: 16, left: 16),
      child: MaterialButton(
        padding: const EdgeInsets.only(right: 20, left: 16, top: 10, bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        minWidth: MediaQuery.of(context).size.width,
        elevation: 0,
        onPressed: () {
          print(login);
          print(password);
          if (formKey.currentState!.validate()) {
            print(login);
            print(password);
            context.read<AuthBloc>().add(AuthLoginEvent(
              login: login, password: password,
            ));
          }
        },
        color: ThemeApp.primaryColor,
        child: Text(
          AppLocalizations.of(context)!.signIn,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: ThemeApp.whiteColor),
        ),
      ),
    );
  }
}
