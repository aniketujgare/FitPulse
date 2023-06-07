import 'package:flutter/material.dart';

import 'exercise_explanation.dart';

class ExerciseStepsCard extends StatelessWidget {
  const ExerciseStepsCard({
    super.key,
    required this.screenWidth,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  final double screenWidth;
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
      width: screenWidth * 1,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: Column(
        children: [
          ExerciseExplanation(
            pointColor: const Color(0xffEA7E43),
            text: text1,
          ),
          ExerciseExplanation(
            pointColor: const Color(0xff12B3A8),
            text: text2,
          ),
          ExerciseExplanation(
            pointColor: const Color(0xff79A6EF),
            text: text3,
          ),
        ],
      ),
    );
  }
}
