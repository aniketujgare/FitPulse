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
