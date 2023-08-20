import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_smm/entities/auth_entities/auth_bloc/auth_bloc.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/ui/buttons/primary_button/primary_button.dart';
import 'package:project_smm/shared/ui/fomr_item/form_input_item/form_input_item.dart';
import 'package:project_smm/shared/ui/text_items/big_welcome_text/big_welcome_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  final TextEditingController _controllerLogin = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              BigWelcomeText(
                  text: AppLocalizations.of(context)!.loginToYourProfile),
              const SizedBox(
                height: 32,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    FormInputItem(
                        controller: _controllerLogin,
                        formName: AppLocalizations.of(context)!.login),
                    FormInputItem(
                        controller: _controllerPassword,
                        formName: AppLocalizations.of(context)!.password),
                    PrimaryButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthLoginEvent(
                                    login: _controllerLogin.text,
                                    password: _controllerPassword.text,
                                  ),
                                );
                          }
                        },
                        buttonName: AppLocalizations.of(context)!.signIn),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.choiceRegion);
                      },
                      child: Text(AppLocalizations.of(context)!.choiceRegion),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
