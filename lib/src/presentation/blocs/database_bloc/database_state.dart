part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseLoadingState extends DatabaseState {}

class DatabaseOperationCompleteState extends DatabaseState {}

class DatabaseCurrentUserState extends DatabaseState {
  final UserModel user;
  const DatabaseCurrentUserState({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}
