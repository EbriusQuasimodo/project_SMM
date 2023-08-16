import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_smm/app/constants/app_routes.dart';
import 'package:project_smm/app/local_storage.dart';
import 'package:project_smm/entities/constants.dart';
import 'package:project_smm/features/auth_feature/auth_bloc/auth_bloc.dart';
import 'package:project_smm/features/auth_feature/auth_button_widget.dart';
import 'package:project_smm/widgets/auth_widgets/change_locale_widget.dart';
import 'package:project_smm/widgets/auth_widgets/login_form_field_widget.dart';
import 'package:project_smm/widgets/auth_widgets/logo_picture_widget.dart';
import 'package:project_smm/widgets/auth_widgets/password_form_field_widget.dart';

class AuthPage extends StatelessWidget {
  AuthPage({
    super.key,
  });

  final TextEditingController _controllerLogin = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state is AuthDoneState) {
          LocalStorage.setString(AppConstants.TOKEN, state.token);
          Navigator.of(context).pushNamed(AppRoutes.mainPage);
        }
      },
      child: Scaffold(
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
                    LoginFormFieldWidget(
                      controllerLogin: _controllerLogin,
                    ),
                    PasswordFormFieldWidget(
                        controllerPassword: _controllerPassword),
                    AuthButtonWidget(
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
                    ),
                    const ChangeLocaleWidget(),
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
