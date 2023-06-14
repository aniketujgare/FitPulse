import 'package:flutter/material.dart';

import '../home_page/point_widget.dart';

class ExerciseExplanation extends StatelessWidget {
  const ExerciseExplanation({
    super.key,
    required this.pointColor,
    required this.text,
    this.style = const TextStyle(color: Color(0xff74777D)),
  });

  final Color pointColor;
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: PointWidget(pointColor: pointColor),
      title: Text(text, style: style),
    );
  }
}
