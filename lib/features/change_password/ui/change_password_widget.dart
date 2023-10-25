import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_smm/features/change_password/bloc/change_password_bloc.dart';
import 'package:project_smm/shared/ui/buttons/primary_button/primary_button.dart';
import 'package:project_smm/shared/ui/form_item/form_input_item/form_input_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePasswordWidget extends StatelessWidget {
  ChangePasswordWidget({super.key});

  final TextEditingController _controllerPasswordOld = TextEditingController();
  final TextEditingController _controllerPasswordNew = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if(state is UnAuthState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }else if (state is ChangePasswordDoneState) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Пароль успешно изменен!'),
            ),
          );
        }},
       child: Form(
         key: _formKey,
         child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            FormInputItem(
                controller: _controllerPasswordOld,
                formName: AppLocalizations.of(context)!.enterOldPassword,
                canHidePassword: true),
            FormInputItem(
                controller: _controllerPasswordNew,
                formName: AppLocalizations.of(context)!.enterNewPassword,
                canHidePassword: true),
            const Spacer(),
            PrimaryButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<ChangePasswordBloc>().add(
                      ChangePersonPasswordEvent(
                        oldPassword: _controllerPasswordOld.text,
                        newPassword: _controllerPasswordNew.text,
                      ),
                    );
                  }
                },
                buttonName: AppLocalizations.of(context)!.save),
            const SizedBox(
              height: 16,
            ),
          ],
      ),
       ),
    );
  }
}
