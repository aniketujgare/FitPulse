import 'package:fitpulse/const.dart';
import 'package:fitpulse/src/presentation/widgets/home_page/point_widget.dart';
import 'package:flutter/material.dart';

class ExerciseElement extends StatelessWidget {
  const ExerciseElement({super.key, this.color});
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Push-Ups',
                style: textStyle,
              ),
              Text(
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
