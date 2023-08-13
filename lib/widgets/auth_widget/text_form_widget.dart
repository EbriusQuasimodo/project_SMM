import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  TextFormWidget({Key? key}) : super(key: key);
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [TextFormField(
      maxLength: 14,
      style: const TextStyle(fontSize: 16),
      controller: _controllerLogin,
      decoration: const InputDecoration(
        counterText: '',
        counterStyle: TextStyle(fontSize: 0),
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal)),
        labelText: 'Логин',
      ),
    ),
      const SizedBox(height: 10,),
      TextFormField(
        maxLength: 14,
        style: const TextStyle(fontSize: 16),
        controller: _controllerPassword,
        decoration: const InputDecoration(
          counterText: '',
          counterStyle: TextStyle(fontSize: 0),
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal)),
          labelText: 'Пароль',
        ),
      ),],);
  }
}
