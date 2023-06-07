import 'dart:math';
import 'package:fitpulse/src/presentation/widgets/workout_page/workout_card.dart';
import 'package:flutter/material.dart';
import '../../../const.dart';
import '../widgets/exercises_page/listtile_trailing.dart';
import '../widgets/home_page/point_widget.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text('Workouts', style: textStyle.copyWith(fontSize: 24)),
        backgroundColor: const Color(0xffF7F7F7),
      ),
      body: Column(
        children: [
          WorkoutCard(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              workout: 'Chest',
              imgPath: 'assets/images/chest.png',
              backColor: const Color(0xffF7F7F7),
              iconBackColor: Colors.black),
          SizedBox(
            height: screenHeight * 0.65,
            width: screenWidth * 0.9,
            child: ListView.builder(
              itemCount: 14,
              itemBuilder: (context, index) {
                final random = Random();
                final pointColor =
                    backColors[random.nextInt(backColors.length)];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: ListTile(
                    leading: PointWidget(pointColor: pointColor),
                    // ListTile Style
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    tileColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 05, horizontal: 20),

                    title: const Text('Push Ups', style: textStyle),
                    trailing: const ListTileTrailing(
                      calories: '24',
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
