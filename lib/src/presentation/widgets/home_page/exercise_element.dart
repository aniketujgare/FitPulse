import 'package:fitpulse/const.dart';
import 'package:fitpulse/src/presentation/widgets/home_page/point_widget.dart';
import 'package:flutter/material.dart';

class ExerciseElement extends StatelessWidget {
  final String exerciseName;

  const ExerciseElement({super.key, this.color, required this.exerciseName});
  final dynamic color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
      child: Row(
        children: [
          PointWidget(pointColor: color),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exerciseName,
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Text(
                "Biceps, Triceps, Shoulders",
                style: TextStyle(fontSize: 12, color: Color(0xff74777D)),
              )
            ],
          ),
          const Spacer(),
          Icon(
            Icons.timer,
            color: const Color(0xff74777D).withOpacity(0.5),
          ),
          const SizedBox(
            width: 8,
          ),
          const Text(
            '10',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Oswald',
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
