import 'package:fitpulse/src/data/repositories/report_repository.dart';
import 'package:fitpulse/src/data/repositories/workout_repository.dart';
import 'package:fitpulse/src/domain/models/exercise_screen_model.dart';
import 'package:fitpulse/src/domain/models/workout_model.dart';
import 'package:fitpulse/src/presentation/blocs/database_bloc/database_bloc.dart';
import 'package:fitpulse/src/presentation/blocs/report_bloc/report_bloc.dart';
import 'package:fitpulse/src/presentation/blocs/workout_bloc/workout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/auth_repository.dart';
import '../../presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../presentation/views/auth_flow.dart';
import '../../presentation/views/complete_profile_page.dart';
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
final databaseCubit = DatabaseBloc();
final workoutRepository = WorkoutRepository();
final workoutBloc = WorkoutBloc(workoutRepository: workoutRepository);
final reportRepository = ReportRepository();
final reportBloc = ReportBloc(reportRepository: reportRepository);

class GoRout {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: GoRoutConstants.createAccountRoutName,
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
            child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(authRepository: authRepository)
                ..add(AuthInitializeEvent()),
            ),
            BlocProvider(
              create: (context) => DatabaseBloc()..add(GetCurrentUserEvent()),
            ),
            BlocProvider(
              create: (context) => workoutBloc..add(GetAllWorkoutEvent()),
            ),
            BlocProvider(
              create: (context) => reportBloc..add(GetReportEvent()),
            ),
          ],
          child: const AuthFlow(),
        )),
      ),
      GoRoute(
        name: GoRoutConstants.homeRoutName,
        path: '/home',
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
      GoRoute(
        name: GoRoutConstants.completeProfileRoutName,
        path: '/completeProfile',
        pageBuilder: (context, state) => MaterialPage(
            child: BlocProvider.value(
          value: databaseCubit..add(GetCurrentUserEvent()),
          child: const CompleteProfilePage(),
        )),
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
        pageBuilder: (context, state) => MaterialPage(
            child: BlocProvider.value(
          value: workoutBloc,
          child: ExercisesPage(
              exerciseScreenModel: state.extra as ExerciseScreenModel),
        )),
      ),
      GoRoute(
        name: GoRoutConstants.reportRoutName,
        path: '/report',
        pageBuilder: (context, state) => MaterialPage(
            child: BlocProvider.value(
          value: reportBloc,
          child: const ReportPage(),
        )),
      ),
      GoRoute(
        name: GoRoutConstants.profileRoutName,
        path: '/profile',
        pageBuilder: (context, state) => MaterialPage(
            child: BlocProvider(
          create: (context) => databaseCubit,
          child: const ProfilePage(),
        )),
      ),
      GoRoute(
        name: GoRoutConstants.exercisedetailsRoutName,
        path: '/exerciseDetails',
        pageBuilder: (context, state) {
          return MaterialPage(
              child: MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: workoutBloc..add(GetAllWorkoutEvent()),
              ),
              BlocProvider.value(
                value: reportBloc,
              ),
            ],
            child:
                ExerciseDetailsPage(workoutModel: state.extra as WorkoutModel),
          ));
        },
      ),
      GoRoute(
        name: GoRoutConstants.updateProfileRoutName,
        path: '/updateProfile',
        pageBuilder: (context, state) =>
            const MaterialPage(child: UpdateProfilePage()),
      ),
    ],
  );
}
