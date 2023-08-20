import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_smm/entities/auth_entities/auth_bloc/auth_bloc.dart';
import 'package:project_smm/shared/ui/buttons/primary_button/primary_button.dart';
import 'package:project_smm/shared/ui/fomr_item/form_input_item/form_input_item.dart';
import 'package:project_smm/widgets/auth_widgets/logo_picture_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  final TextEditingController _controllerLogin = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const LogoPictureWidget(),
            const SizedBox(
              height: 131,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  FormInputItem(controller: _controllerLogin, formName: 'Логин'),
                  FormInputItem(controller: _controllerPassword, formName: 'Пароль'),
                  PrimaryButton(onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                        AuthLoginEvent(
                          login: _controllerLogin.text,
                          password: _controllerPassword.text,
                        ),
                      );
                    }
                  }, buttonName: AppLocalizations.of(context)!.signIn),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
