part of 'workout_bloc.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState();

  @override
  List<Object> get props => [];
}

class WorkoutInitial extends WorkoutState {}

class WorkoutLoadingState extends WorkoutState {}

class WorkoutLoaded extends WorkoutState {
  final List<WorkoutModel> workoutModel;

  const WorkoutLoaded({required this.workoutModel});
}

class AllWorkoutLoaded extends WorkoutState {
  final List<List<WorkoutModel>> workoutModelsList;

  const AllWorkoutLoaded({required this.workoutModelsList});
}
