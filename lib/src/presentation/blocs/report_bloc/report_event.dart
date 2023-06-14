part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class GetReportEvent extends ReportEvent {}

class AddExerciseToReportEvent extends ReportEvent {
  final WorkoutModel workoutModel;

  const AddExerciseToReportEvent({required this.workoutModel});
}
