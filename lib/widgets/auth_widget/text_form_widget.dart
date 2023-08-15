import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_smm/app/constants/theme_app.dart';
import 'package:project_smm/features/auth_feature/auth_bloc/auth_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FieldAndButtonAuthWidget extends StatelessWidget {
  FieldAndButtonAuthWidget({
    Key? key,
  }) : super(key: key);
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6, left: 16, right: 16),
            child: SizedBox(
              height: 40,
              child: TextFormField(
                maxLength: 14,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                controller: _controllerLogin,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Поле должно быть заполнено';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  counterText: '',
                  counterStyle: TextStyle(fontSize: 0),
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 0, minHeight: 0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide(
                          color: ThemeApp.secondaryColorTextAndIcons)),
                  labelText: 'Логин',
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 6, bottom: 24, left: 16, right: 16),
            child: SizedBox(
              height: 40,
              child: TextFormField(
                maxLength: 14,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                controller: _controllerPassword,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Поле должно быть заполнено';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  counterText: '',
                  counterStyle: TextStyle(fontSize: 0),
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 0, minHeight: 0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide(
                          color: ThemeApp.secondaryColorTextAndIcons)),
                  labelText: 'Пароль',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: MaterialButton(
              padding: const EdgeInsets.only(
                  right: 20, left: 16, top: 10, bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minWidth: MediaQuery.of(context).size.width,
              elevation: 0,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(AuthLoginEvent(
                        login: _controllerLogin.text,
                        password: _controllerPassword.text,
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
          ),
          //AuthButtonWidget(login: _controllerLogin.text,password: _controllerPassword.text,formKey: _formKey,),
        ],
      ),
    );
  }
}
