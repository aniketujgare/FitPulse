import 'package:equatable/equatable.dart';
import 'package:fitpulse/src/data/repositories/workout_repository.dart';
import 'package:fitpulse/src/domain/models/workout_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository workoutRepository;
  WorkoutBloc({required this.workoutRepository}) : super(WorkoutInitial()) {
    on<GetChestWorkoutEvent>((event, emit) async {
      emit(WorkoutLoadingState());
      var workout = await workoutRepository.fetchChestWorkout();
      emit(WorkoutLoaded(workoutModel: workout));
    });
    on<GetAllWorkoutEvent>((event, emit) async {
      emit(WorkoutLoadingState());
      var workout = await workoutRepository.getAllWorkout();
      emit(AllWorkoutLoaded(workoutModelsList: workout));
    });
  }
}
