import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'exercise_element.dart';

class ExerciseCard extends StatelessWidget {
  ExerciseCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  final List<Color> colors = [
    const Color(0xffEA7E43),
    const Color(0xff12B3A8),
    const Color(0xff79A6EF),
    const Color(0xffA087D3)
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: screenHeight * 0.35,
              width: screenWidth * 0.19,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffC75469), Color(0xffCE435D)]),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
            Positioned(
              bottom: 15,
              left: 10,
              child: Container(
                height: screenHeight * 0.2,
                width: screenWidth * 0.14,
                decoration: const BoxDecoration(
                    color: Color(0xffA13A56),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: SvgPicture.asset(
                'assets/svg/workout.svg',
                height: 40,
                width: 40,
                color: Colors.white,
              ),
            ),
            Positioned(
                bottom: 65,
                left: 23,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'CHEST',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white.withOpacity(0.15)),
                  ),
                )),
          ],
        ),
        const Spacer(),
        Container(
          height: screenHeight * 0.35,
          width: screenWidth * 0.7,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                final color = colors[index];
                return ExerciseElement(
                  color: color,
                );
              }),
        ),
      ],
    );
  }
}
