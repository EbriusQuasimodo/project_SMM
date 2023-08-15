import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_smm/app/constants/app_routes.dart';
import 'package:project_smm/features/auth_feature/auth_bloc/auth_bloc.dart';
import 'package:project_smm/widgets/auth_widget/text_form_widget.dart';
import 'package:project_smm/widgets/auth_widget/logo_picture_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthStartState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const LogoPictureWidget(),
                  const SizedBox(
                    height: 131,
                  ),
                  FieldAndButtonAuthWidget(),
                ],
              ),
            );
          } else if (state is AuthFailedState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const LogoPictureWidget(),
                  const SizedBox(
                    height: 131,
                  ),
                  FieldAndButtonAuthWidget(),
                  Text(
                    state.message,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            );
          } else if (state is AuthDoneState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushNamed(AppRoutes.mainPage);
            });
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
