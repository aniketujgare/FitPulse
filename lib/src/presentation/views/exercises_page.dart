// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:fitpulse/src/config/router/app_router_constants.dart';
import 'package:fitpulse/src/domain/models/exercise_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../const.dart';
import '../widgets/exercises_page/listtile_trailing.dart';
import '../widgets/home_page/point_widget.dart';
import '../widgets/workout_page/workout_card.dart';

class ExercisesPage extends StatelessWidget {
  final ExerciseScreenModel exerciseScreenModel;
  const ExercisesPage({
    Key? key,
    required this.exerciseScreenModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text('Workouts', style: textStyle.copyWith(fontSize: 24)),
        backgroundColor: const Color(0xffF7F7F7),
      ),
      body: Column(
        children: [
          WorkoutCard(
              onTap: () {},
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              workout: exerciseScreenModel.exerciseName,
              imgPath: exerciseScreenModel.image,
              noOfExercises: exerciseScreenModel.workoutList.length,
              backColor: const Color(0xffF7F7F7),
              iconBackColor: Colors.black),
          SizedBox(
            height: screenHeight * 0.65,
            width: screenWidth * 0.9,
            child: ListView.builder(
              itemCount: exerciseScreenModel.workoutList.length,
              itemBuilder: (context, index) {
                final random = Random();
                final pointColor =
                    backColors[random.nextInt(backColors.length)];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(GoRoutConstants.exercisedetailsRoutName,
                          extra: exerciseScreenModel.workoutList[index]);
                    },
                    child: ListTile(
                      leading: PointWidget(pointColor: pointColor),
                      // ListTile Style
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      tileColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 05, horizontal: 20),

                      title: Text(
                          exerciseScreenModel.workoutList[index].exercise,
                          style: textStyle),
                      trailing: ListTileTrailing(
                        calories: exerciseScreenModel
                            .workoutList[index].calories
                            .toString(),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
