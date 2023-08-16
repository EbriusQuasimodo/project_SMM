import 'package:flutter/material.dart';
import 'package:project_smm/app/constants/theme_app.dart';

class PasswordFormFieldWidget extends StatelessWidget {
  final TextEditingController controllerPassword;

  const PasswordFormFieldWidget({
    Key? key,
    required this.controllerPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 24, left: 16, right: 16),
      child: TextFormField(
        maxLength: 14,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        controller: controllerPassword,
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
          labelText: 'Пароль',
        ),
      ),
    );
  }
}
