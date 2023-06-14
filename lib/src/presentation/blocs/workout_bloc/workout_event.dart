part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

class GetChestWorkoutEvent extends WorkoutEvent {}

class GetAllWorkoutEvent extends WorkoutEvent {}
