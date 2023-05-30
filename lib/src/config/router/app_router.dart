import 'package:fitpulse/src/config/router/app_router_constants.dart';
import 'package:fitpulse/src/presentation/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../presentation/views/home_page.dart';

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
        name: GoRoutConstants.loginRoutName,
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
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
    ],
  );
}
