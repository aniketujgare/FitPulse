import 'package:flutter/material.dart';

class PointWidget extends StatelessWidget {
  const PointWidget({
    super.key,
    required this.pointColor,
  });

  final Color pointColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 8,
      decoration: BoxDecoration(
          color: pointColor,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
    );
  }
}
