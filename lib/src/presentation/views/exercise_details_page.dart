import 'package:flutter/material.dart';
import '../../../const.dart';
import '../widgets/exercise_details_page/exercise_steps_card.dart';
import '../widgets/exercises_page/listtile_trailing.dart';

class ExerciseDetailsPage extends StatelessWidget {
  const ExerciseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        toolbarHeight: 70,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text('Push-Ups', style: textStyle.copyWith(fontSize: 24)),
        backgroundColor: const Color(0xffF7F7F7),
        actions: const [
          ListTileTrailing(
            calories: '24',
            calFontSize: 24,
          ),
          SizedBox(
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
              Container(
                height: 200,
                width: screenWidth * 1,
                decoration: const BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.all(Radius.circular(18))),
              ),
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
                text1:
                    "Start by assuming a high plank position with your hands slightly wider than shoulder-width apart, fingers pointing forward, and arms extended.",
                text2:
                    "Lower your body towards the ground by bending your elbows until your chest is just above the floor, keeping your core engaged and your back straight.",
                text3:
                    "Push through your palms to extend your arms and raise your body back to the starting position, maintaining a controlled and steady pace throughout the exercise.",
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Important',
                style: textStyle.copyWith(fontSize: 22),
              ),
              const SizedBox(
                height: 15,
              ),
              ExerciseStepsCard(
                screenWidth: screenWidth,
                text1:
                    "Start by assuming a high plank position with your hands slightly wider than shoulder-width apart, fingers pointing forward, and arms extended.",
                text2:
                    "Lower your body towards the ground by bending your elbows until your chest is just above the floor, keeping your core engaged and your back straight.",
                text3:
                    "Push through your palms to extend your arms and raise your body back to the starting position, maintaining a controlled and steady pace throughout the exercise.",
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
