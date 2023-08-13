import 'package:flutter/material.dart';
import 'package:project_smm/widgets/auth_widget/change_locale_widget.dart';
import 'package:project_smm/widgets/auth_widget/text_form_widget.dart';
import 'package:project_smm/widgets/auth_widget/welcome_text_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 140,
                  ),
                  const WelcomeTextWidget(),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormWidget(),
                  const ChangeLocaleWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
