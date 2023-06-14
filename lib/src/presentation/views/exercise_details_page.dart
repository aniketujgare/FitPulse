import 'package:fitpulse/src/presentation/blocs/report_bloc/report_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const.dart';
import '../../domain/models/workout_model.dart';
import '../widgets/exercise_details_page/exercise_steps_card.dart';
import '../widgets/exercises_page/listtile_trailing.dart';
import 'cached_video_player.dart';

class ExerciseDetailsPage extends StatelessWidget {
  final WorkoutModel workoutModel;
  const ExerciseDetailsPage({super.key, required this.workoutModel});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //if done add in report
          context
              .read<ReportBloc>()
              .add(AddExerciseToReportEvent(workoutModel: workoutModel));
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Workout Is Done')));
        },
        child: const Icon(Icons.done),
      ),
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        toolbarHeight: 70,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(workoutModel.exercise,
            style: textStyle.copyWith(fontSize: 24)),
        backgroundColor: const Color(0xffF7F7F7),
        actions: [
          ListTileTrailing(
            calories: '${workoutModel.calories}',
            calFontSize: 24,
          ),
          const SizedBox(
            width: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WorkoutVideoPlayer(videoUrl: workoutModel.videoUrl),
              const SizedBox(
                height: 15,
              ),
              Text(
                'How to do this exercise',
                style: textStyle.copyWith(fontSize: 22),
              ),
              const SizedBox(
                height: 15,
              ),
              ExerciseStepsCard(
                screenWidth: screenWidth,
                text1: workoutModel.step1,
                text2: workoutModel.step2,
                text3: workoutModel.step3,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
