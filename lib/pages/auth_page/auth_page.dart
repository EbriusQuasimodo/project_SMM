import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_smm/entities/auth_entities/auth_bloc/auth_bloc.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/widgets/auth_widgets/login_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state is AuthDoneState) {
         // LocalStorage.setString(AppConstants.TOKEN, state.token);
          Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.mainPage, (route) => false);
        }
      },
      child: LoginWidget(),
    );
  }
}
