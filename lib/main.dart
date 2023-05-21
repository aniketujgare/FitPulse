import 'package:fitpulse/src/data/datasources/appwrite.dart';
import 'package:fitpulse/src/data/repositories/auth_repository.dart';
import 'package:fitpulse/src/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:fitpulse/src/presentation/views/home_page.dart';
import 'package:fitpulse/src/presentation/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository();
    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: authRepository)..add(AuthInitializeEvent()),
      child: MaterialApp(
        title: 'FitPulse',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          FloatingActionButton(onPressed: () async {
            context.read<AuthBloc>().add(LogOutEvent());
          }),
          Center(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthInitial) {
                  return const CircularProgressIndicator();
                } else if (state is AuthAuthenticated) {
                  return const HomePage();
                } else {
                  return const LoginPage();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
