import 'package:fitpulse/src/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fitpulse/src/presentation/views/create_account_page.dart';
import 'package:fitpulse/src/presentation/views/error_page.dart';
import 'package:fitpulse/src/presentation/views/home_page.dart';
import 'package:fitpulse/src/presentation/views/login_page.dart';
import 'package:fitpulse/src/presentation/views/reset_password_page.dart';
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
            return const HomePage(userEmail: 'userEmail');
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
