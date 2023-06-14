import 'package:fitpulse/src/presentation/widgets/exercise_details_page/exercise_explanation.dart';
import 'package:fitpulse/src/presentation/widgets/home_page/point_widget.dart';
import 'package:flutter/material.dart';

class ExerciseElement extends StatelessWidget {
  final String exerciseName;

  const ExerciseElement({super.key, this.color, required this.exerciseName});
  final dynamic color;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8, right: 0, top: 6, bottom: 5),
        child: ListTile(
          leading: PointWidget(pointColor: color),
          title: Text(
            exerciseName,
            style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          trailing: SizedBox(
            width: 50,
            child: Row(children: [
              Icon(
                Icons.timer,
                size: 20,
                color: const Color(0xff74777D).withOpacity(0.5),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                '10',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Oswald',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )
            ]),
          ),
        ));
  }
}
