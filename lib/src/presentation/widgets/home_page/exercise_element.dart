import 'package:flutter/material.dart';

class ExerciseElement extends StatelessWidget {
  const ExerciseElement({super.key, this.color});
  final dynamic color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 8,
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(15))),
          ),
          const SizedBox(
            width: 15,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Push-Ups',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
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
