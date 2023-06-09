import 'package:fitpulse/src/domain/models/exercise_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../const.dart';
import '../../config/router/app_router_constants.dart';
import '../blocs/workout_bloc/workout_bloc.dart';
import '../widgets/workout_page/workout_card.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffF7F7F7),
            appBar: AppBar(
              toolbarHeight: 70,
              title: Text(
                'Workouts',
                style: textStyle.copyWith(fontSize: 26),
              ),
              backgroundColor: Colors.transparent,
            ),
            body: BlocBuilder<WorkoutBloc, WorkoutState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 75),
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final List<String> workouts = [
                        'Chest',
                        'Tricep',
                        'Bicep',
                        'Back',
                        'Shoulder',
                        'Legs',
                      ];
                      final workoutName = workouts[index];

                      final List<String> workoutImgs = [
                        'assets/images/chest.png',
                        'assets/images/tricep.png',
                        'assets/images/bicep.png',
                        'assets/images/back.png',
                        'assets/images/shoulder.png',
                        'assets/images/legs.png',
                      ];

                      final imgPath = workoutImgs[index];

                      final backColor = backColors[index];

                      const List<Color> iconColors = [
                        Color(0xffF8C888),
                        Color(0xffA83D5B),
                        Color(0xff38B19D),
                        Color(0xff4883E4),
                        Color(0xff9872E4),
                        Color(0xffF59A57),
                      ];
                      final iconBackColor = iconColors[index];

                      if (state is AllWorkoutLoaded) {
                        var workList = state.workoutModelsList;

                        var wm = ExerciseScreenModel(
                            exerciseName: workoutName,
                            image: imgPath,
                            workoutList: workList[index]);
                        return WorkoutCard(
                          noOfExercises: workList[index].length,
                          onTap: () {
                            context.pushNamed(GoRoutConstants.exercisesRoutName,
                                extra: wm);
                          },
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          workout: workoutName,
                          imgPath: imgPath,
                          backColor: backColor,
                          iconBackColor: iconBackColor,
                        );
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            height: screenHeight * 0.2,
                            width: screenWidth * 1,
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            )));
  }
}
