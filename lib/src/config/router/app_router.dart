import 'package:fitpulse/src/config/router/app_router_constants.dart';
import 'package:fitpulse/src/presentation/views/complete_profile_page.dart';
import 'package:fitpulse/src/presentation/views/create_account_page.dart';
import 'package:fitpulse/src/presentation/views/exercise_details_page.dart';
import 'package:fitpulse/src/presentation/views/exercises_page.dart';
import 'package:fitpulse/src/presentation/views/reset_password_page.dart';
import 'package:fitpulse/src/presentation/views/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../presentation/views/home_page.dart';
import '../../presentation/views/login_page.dart';

class GoRout {
  GoRouter router = GoRouter(
    // redirect: (context, state) {
    //   final userAutheticated = context.watch<AuthBloc>().state;
    //   if (userAutheticated is AuthAuthenticated) {
    //     return '/home';
    //   } else {
    //     return '/';
    //   }
    // },
    routes: [
      GoRoute(
        name: GoRoutConstants.createAccountRoutName,
        path: '/createAccount',
        pageBuilder: (context, state) =>
            const MaterialPage(child: CreateAccountPage()),
      ),
      GoRoute(
        name: GoRoutConstants.homeRoutName,
        path: '/home',
        pageBuilder: (context, state) => const MaterialPage(
          child: HomePage(
            userEmail: 'aniket@go.com',
          ),
        ),
      ),
      GoRoute(
        name: GoRoutConstants.loginRoutName,
        path: '/login',
        pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
      ),
      GoRoute(
        name: GoRoutConstants.resetPasswordRoutName,
        path: '/resetPassword',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ResetPasswordPage()),
      ),
      GoRoute(
        name: GoRoutConstants.completeProfileRoutName,
        path: '/completeProfile',
        pageBuilder: (context, state) =>
            const MaterialPage(child: CompleteProfilePage()),
      ),
      GoRoute(
        name: GoRoutConstants.workoutRoutName,
        path: '/workout',
        pageBuilder: (context, state) =>
            const MaterialPage(child: WorkoutPage()),
      ),
      GoRoute(
        name: GoRoutConstants.exercisesRoutName,
        path: '/exercises',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ExercisesPage()),
      ),
      GoRoute(
        name: GoRoutConstants.exercisedetailsRoutName,
        path: '/',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ExerciseDetailsPage()),
      ),
    ],
  );
}
