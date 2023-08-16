import 'package:flutter/material.dart';
import 'package:project_smm/app/constants/theme_app.dart';

class LoginFormFieldWidget extends StatelessWidget {
  final TextEditingController controllerLogin;

  const LoginFormFieldWidget({
    Key? key,
    required this.controllerLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, left: 16, right: 16),
      child: TextFormField(
        maxLength: 14,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        controller: controllerLogin,
        validator: (val) {
          if (val!.isEmpty) {
            return 'Поле должно быть заполнено';
          }
          return null;
        },
        decoration: const InputDecoration(
          counterText: '',
          counterStyle: TextStyle(fontSize: 0),
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide:
                  BorderSide(color: ThemeApp.secondaryColorTextAndIcons)),
          labelText: 'Логин',
        ),
      ),
    );
  }
}
