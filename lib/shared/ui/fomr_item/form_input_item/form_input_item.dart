import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class FormInputItem extends StatelessWidget {
  final TextEditingController controller;
  final String formName;
  const FormInputItem({super.key, required this.controller, required this.formName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      child: TextFormField(
        maxLength: 14,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        controller: controller,
        validator: (val) {
          if (val!.isEmpty) {
            return 'Поле должно быть заполнено';
          }
          return null;
        },
        decoration: InputDecoration(
          counterText: '',
          counterStyle: const TextStyle(fontSize: 0),
          prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide:
              BorderSide(color: ThemeApp.secondaryColorTextAndIcons)),
          labelText: formName,
        ),
      ),
    );
  }
}
