import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth_bloc/auth_bloc.dart';
import '../widgets/custom_button.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          const Text(
            'Error',
            style: TextStyle(
              color: Colors.red,
              fontSize: 26,
            ),
          ),
          FitPulseButton(
              onTap: () => context.read<AuthBloc>().add(AuthInitializeEvent()),
              text: 'Go Back',
              fontSize: 26,
              showArrow: false),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
