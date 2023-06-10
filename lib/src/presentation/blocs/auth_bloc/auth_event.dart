// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitializeEvent extends AuthEvent {}

class AuthenticatedEvent extends AuthEvent {}

class UnautheticatedEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

class CreateAccountEvent extends AuthEvent {}

class AuthErrorEvent extends AuthEvent {}

class DispatchCreateAccountEvent extends AuthEvent {
  final String email;
  final String password;
  const DispatchCreateAccountEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

class DispatchLoginAccountEvent extends AuthEvent {
  final String email;
  final String password;
  const DispatchLoginAccountEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

class DispatchResetAccountEvent extends AuthEvent {
  final String email;
  final String password;
  const DispatchResetAccountEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}
