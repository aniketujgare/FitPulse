import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/database_repository.dart';
import '../../../domain/models/user_model.dart';

part 'database_event.dart';
part 'database_state.dart';

DatabaseRepository database = DatabaseRepository();

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc() : super(DatabaseInitial()) {
    on<GetCurrentUserEvent>((event, emit) async {
      emit(DatabaseLoadingState());
      var user = await database.getCurrentUser();
      emit(DatabaseCurrentUserState(user: user));
    });
    on<DispatchUpdateUserProfileEvent>((event, emit) async {
      emit(DatabaseLoadingState());
      var user = await database.updateUserProfile(userModel: event.userModel);
      emit(DatabaseCurrentUserState(user: user));
    });
  }
}
