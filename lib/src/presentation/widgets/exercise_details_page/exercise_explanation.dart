import 'package:flutter/material.dart';

import '../home_page/point_widget.dart';

class ExerciseExplanation extends StatelessWidget {
  const ExerciseExplanation({
    super.key,
    required this.pointColor,
    required this.text,
  });

  final Color pointColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: PointWidget(pointColor: pointColor),
      title: Text(
        text,
        style: const TextStyle(color: Color(0xff74777D)),
      ),
    );
  }
}
