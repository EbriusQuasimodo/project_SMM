import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class SearchFormField extends StatefulWidget {
  final TextEditingController controller;
  final String formName;

  const SearchFormField(
      {super.key,
        required this.controller,
        required this.formName,});

  @override
  State<SearchFormField> createState() => _SearchFormFieldState();
}

class _SearchFormFieldState extends State<SearchFormField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      child: TextFormField(
        onTap:(){
          widget.controller.clear();
        },
        maxLength: 14,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        controller: widget.controller,
        validator: (val) {
          if (val!.isEmpty) {
            return '';
          }
          return null;
        },
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
          suffixIcon: const Icon(
            Icons.search,
            color: ThemeApp.secondaryColorTextAndIcons,
          ),
        ),
      ),
    );
  }
}
