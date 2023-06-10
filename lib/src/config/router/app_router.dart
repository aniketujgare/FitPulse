import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/auth_repository.dart';
import '../../presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../presentation/views/auth_flow.dart';
import '../../presentation/views/exercise_details_page.dart';
import '../../presentation/views/exercises_page.dart';
import '../../presentation/views/home_page.dart';
import '../../presentation/views/login_page.dart';
import '../../presentation/views/profile_page.dart';
import '../../presentation/views/report_screen.dart';
import '../../presentation/views/reset_password_page.dart';
import '../../presentation/views/update_profile_page.dart';
import '../../presentation/views/workout_page.dart';
import 'app_router_constants.dart';

final authRepository = AuthRepository();

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
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
            child: BlocProvider(
          create: (context) => AuthBloc(authRepository: authRepository)
            ..add(AuthInitializeEvent()),
          child: const AuthFlow(),
        )),
      ),
      GoRoute(
        name: GoRoutConstants.homeRoutName,
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          child: HomePage(),
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
      // GoRoute(
      //   name: GoRoutConstants.completeProfileRoutName,
      //   path: '/completeProfile',
      //   pageBuilder: (context, state) =>
      //       const MaterialPage(child: CompleteProfilePage()),
      // ),
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
        path: '/exerciseDetails',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ExerciseDetailsPage()),
      ),
      GoRoute(
        name: GoRoutConstants.reportRoutName,
        path: '/report',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ReportPage()),
      ),
      GoRoute(
        name: GoRoutConstants.profileRoutName,
        path: '/profile',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ProfilePage()),
      ),
      GoRoute(
        name: GoRoutConstants.updateProfileRoutName,
        path: '/updateProfile',
        pageBuilder: (context, state) =>
            const MaterialPage(child: UpdateProfilePage()),
      ),
      // GoRoute(
      //   name: GoRoutConstants.completeProfileRoutName,
      //   path: '/completeProfile',
      //   pageBuilder: (context, state) =>
      //       const MaterialPage(child: CompleteProfilePage()),
      // ),
    ],
  );
}
