import '../blocs/app_navigator_cubit/app_navigator_cubit.dart';
import '../blocs/auth_bloc/auth_bloc.dart';
import 'create_account_page.dart';
import 'error_page.dart';
import 'fit_pulse_ui_navigator.dart';
import 'login_page.dart';
import 'reset_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthFlow extends StatelessWidget {
  const AuthFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          if (authState is AuthAuthenticated) {
            return BlocProvider(
              create: (context) => AppNavigatorCubit(),
              child: const FIitPulseUiNavigator(),
            );
          } else if (authState is AuthUnauthenticated) {
            return const LoginPage();
          } else if (authState is ForgotPasswordState) {
            return const ResetPasswordPage();
          } else if (authState is CreateAccountPageState) {
            return const CreateAccountPage();
          } else if (authState is ErrorPageState) {
            return const ErrorPage();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
