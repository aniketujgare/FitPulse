part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();

  @override
  List<Object> get props => [];
}

class CreateDocumentEvent extends DatabaseEvent {}

class GetDocumentEvent extends DatabaseEvent {}

class GetCurrentUserEvent extends DatabaseEvent {}

class DispatchUpdateUserProfileEvent extends DatabaseEvent {
  final UserModel userModel;

  const DispatchUpdateUserProfileEvent({
    required this.userModel,
  });
}
