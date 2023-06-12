import 'package:flutter/material.dart';

import '../../../const.dart';
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
              title: const Text(
                'Workouts',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              backgroundColor: Colors.transparent,
            ),
            body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                final List<String> workouts = [
                  'Chest',
                  'Tricep',
                  'Bicep',
                  'Back',
                  'Shoulder',
                ];
                final workoutName = workouts[index];

                final List<String> workoutImgs = [
                  'assets/images/chest.png',
                  'assets/images/tricep.png',
                  'assets/images/bicep.png',
                  'assets/images/back.png',
                  'assets/images/shoulder.png',
                ];

                final imgPath = workoutImgs[index];

                final backColor = backColors[index];

                const List<Color> iconColors = [
                  Color(0xffF8C888),
                  Color(0xffA83D5B),
                  Color(0xff38B19D),
                  Color(0xff4883E4),
                  Color(0xff9872E4),
                ];
                final iconBackColor = iconColors[index];

                return WorkoutCard(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  workout: workoutName,
                  imgPath: imgPath,
                  backColor: backColor,
                  iconBackColor: iconBackColor,
                );
              },
            )));
  }
}
