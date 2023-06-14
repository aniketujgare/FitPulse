// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

ReportModel reportModelFromJson(String str) =>
    ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel data) => json.encode(data.toJson());

class ReportModel {
  final String user;
  final int cal;
  final int time;
  final int noOfWorkouts;
  final List<String> exercisesDone;

  ReportModel({
    required this.user,
    required this.cal,
    required this.time,
    required this.noOfWorkouts,
    required this.exercisesDone,
  });
  ReportModel copyWith({
    String? user,
    int? cal,
    int? time,
    int? noOfWorkouts,
    List<String>? exercisesDone,
  }) =>
      ReportModel(
        user: user ?? this.user,
        cal: cal ?? this.cal,
        time: time ?? this.time,
        noOfWorkouts: noOfWorkouts ?? this.noOfWorkouts,
        exercisesDone: exercisesDone ?? this.exercisesDone,
      );
  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        user: json["user"],
        cal: json["cal"],
        time: json["time"],
        noOfWorkouts: json["no_of_workouts"],
        exercisesDone: List<String>.from(json["exercises_done"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "cal": cal,
        "time": time,
        "no_of_workouts": noOfWorkouts,
        "exercises_done": List<dynamic>.from(exercisesDone.map((x) => x)),
      };
}
