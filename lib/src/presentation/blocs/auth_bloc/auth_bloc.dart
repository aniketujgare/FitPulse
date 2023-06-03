import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';
import 'package:fitpulse/src/data/datasources/appwrite.dart';
import 'package:fitpulse/src/data/repositories/auth_repository.dart';
import 'package:fitpulse/src/presentation/views/create_account_page.dart';
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
      emit(AuthLoadingState());
      await authRepository.logout();
      emit(AuthUnauthenticated());
    });
    on<DispatchCreateAccountEvent>((event, emit) async {
      emit(AuthLoadingState());
      var user = await authRepository.signUp(
          email: event.email, password: event.password);
      if (user == null) {
        emit(AuthAuthenticated(user: user!));
      } else {
        //error to create account state
      }
    });
    on<DispatchLoginAccountEvent>((event, emit) async {
      emit(AuthLoadingState());
      var user = await authRepository.login(
          email: event.email, password: event.password);
      emit(AuthAuthenticated(user: user));
    });
    on<DispatchResetAccountEvent>((event, emit) {
      // authRepository.login(email: event.email, password: event.password);
    });
  }
}
