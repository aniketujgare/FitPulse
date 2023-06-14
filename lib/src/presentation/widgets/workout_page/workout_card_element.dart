import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WorkoutCardElement extends StatelessWidget {
  const WorkoutCardElement({
    super.key,
    required this.workout,
    required this.iconBackColor,
    this.iconColor = Colors.white,
    required this.noOfExercises,
  });

  final String workout;
  final Color iconBackColor;
  final Color iconColor;
  final int noOfExercises;

  final headStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Oswald',
      fontSize: 36,
      fontWeight: FontWeight.w300);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            workout,
            style: headStyle,
          ),
          Text(
            'Exercises',
            style: headStyle,
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: iconBackColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: SvgPicture.asset(
                  'assets/svg/workout.svg',
                  height: 30,
                  width: 30,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '$noOfExercises Exercises',
                style: headStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
