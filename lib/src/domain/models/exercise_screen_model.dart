import 'package:fitpulse/src/domain/models/workout_model.dart';

class ExerciseScreenModel {
  final List<WorkoutModel> workoutList;
  final String exerciseName;
  final String image;

  ExerciseScreenModel(
      {required this.workoutList,
      required this.exerciseName,
      required this.image});
}
