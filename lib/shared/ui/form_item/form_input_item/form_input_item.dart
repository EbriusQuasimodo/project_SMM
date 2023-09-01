import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/shared/constants/errors_constants/errors_constants.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class FormInputItem extends StatefulWidget {
  final TextEditingController controller;
  final String formName;
  final bool canHidePassword;

  const FormInputItem(
      {super.key,
      required this.controller,
      required this.formName,
      required this.canHidePassword});

  @override
  State<FormInputItem> createState() => _FormInputItemState();
}

class _FormInputItemState extends State<FormInputItem> {
  late bool passwordObscured;

  @override
  void initState() {
    super.initState();
    passwordObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      child: TextFormField(
        maxLength: 14,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        controller: widget.controller,
        validator: (val) {
          if (val!.isEmpty) {
            return Errors.emptyString;
          }
          return null;
        },
        obscureText: widget.canHidePassword ? passwordObscured : false,
        decoration: InputDecoration(
          counterText: '',
          counterStyle: const TextStyle(fontSize: 0),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide:
                  BorderSide(color: ThemeApp.secondaryColorTextAndIcons)),
          labelText: widget.formName,
          suffixIcon: widget.canHidePassword
              ? MaterialButton(
                  shape: const CircleBorder(),
                  onPressed: () {
                    setState(() {
                      passwordObscured = !passwordObscured;
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/images/icons/shared/eye.svg',
                    height: 24,
                    width: 24,
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
