// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WorkoutModel {
  final String exercise;
  final int calories;
  final int time;
  final String videoUrl;
  final String step1;
  final String step2;
  final String step3;

  WorkoutModel({
    required this.exercise,
    required this.calories,
    required this.time,
    required this.videoUrl,
    required this.step1,
    required this.step2,
    required this.step3,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exercise': exercise,
      'calories': calories,
      'time': time,
      'videoUrl': videoUrl,
      'step1': step1,
      'step2': step2,
      'step3': step3,
    };
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      exercise: map['exercise'] as String,
      calories: map['cal'] as int,
      time: map['time'] ?? 10,
      videoUrl: map['videoUrl'] as String,
      step1: map['step1'] as String,
      step2: map['step2'] as String,
      step3: map['step3'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutModel.fromJson(String source) =>
      WorkoutModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
