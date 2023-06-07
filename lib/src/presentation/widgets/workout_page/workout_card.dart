import 'package:fitpulse/src/presentation/widgets/workout_page/workout_card_element.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.workout,
    required this.imgPath,
    required this.backColor,
    this.iconColor = Colors.white,
    required this.iconBackColor,
  });

  final double screenHeight;
  final double screenWidth;
  final String workout;
  final String imgPath;
  final Color backColor;
  final Color iconColor;
  final Color iconBackColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        height: screenHeight * 0.2,
        width: screenWidth * 1,
        decoration: BoxDecoration(
            color: backColor,
            borderRadius: const BorderRadius.all(Radius.circular(18))),
        child: Stack(
          children: [
            WorkoutCardElement(
              workout: workout,
              iconBackColor: iconBackColor,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                imgPath,
                fit: BoxFit.fill,
                // scale: 0.6,
                height: screenHeight * 0.2,
                width: screenWidth * 0.58,
              ),
            )
          ],
        ),
      ),
    );
  }
}
