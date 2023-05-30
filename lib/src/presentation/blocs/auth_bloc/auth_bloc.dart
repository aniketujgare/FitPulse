import 'dart:ffi';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';
import 'package:fitpulse/src/data/datasources/appwrite.dart';
import 'package:fitpulse/src/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthInitializeEvent>((event, emit) async {
      //check if user session is there
      bool session = await authRepository.checkSession();

      if (session == true) {
        final user = await authRepository.getUser();
        emit(AuthAuthenticated(user: user));
      } else {
        //log in user
        // const email = 'aniket@appwrite.io';
        // const password = 'passwodrd123';
        emit(AuthUnauthenticated());
      }
    });
    on<LogOutEvent>((event, emit) async {
      authRepository.logout();
      emit(AuthUnauthenticated());
    });
  }
}
