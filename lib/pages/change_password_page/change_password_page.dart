import 'package:flutter/material.dart';
import 'package:project_smm/shared/ui/app_bar_items/app_bar_with_leading_and_title/app_bar_with_leading_and_title.dart';
import 'package:project_smm/shared/ui/buttons/primary_button/primary_button.dart';
import 'package:project_smm/shared/ui/fomr_item/form_input_item/form_input_item.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});
  final TextEditingController _controllerPasswordOld = TextEditingController();
  final TextEditingController _controllerPasswordNew = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithLeadingAndTitle(
          titleText: 'Смена пароля',
          onTap: () {
            Navigator.of(context).pop();
          }),
      body: Column(children: [
        const SizedBox(height: 16,),
        FormInputItem(controller: _controllerPasswordOld, formName: 'Введите старый пароль', canHidePassword: true),
        FormInputItem(controller: _controllerPasswordNew, formName: 'Введите новый пароль', canHidePassword: true),
        const Spacer(),
        PrimaryButton(onTap: (){Navigator.of(context).pop();}, buttonName: 'Сохранить'),
        const SizedBox(height: 16,),
      ],),
    );
  }
}
