import 'package:flutter/material.dart';

import '../../../../const.dart';

class ReportCardElement extends StatelessWidget {
  const ReportCardElement({
    super.key,
    required this.name,
    required this.value,
    required this.valueColor,
  });

  final String name;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: textStyle.copyWith(color: Colors.white, fontSize: 20),
        ),
        Text(
          value,
          style: textStyle.copyWith(
              color: valueColor,
              fontFamily: 'Oswald',
              fontWeight: FontWeight.bold,
              fontSize: 35),
        )
      ],
    );
  }
}
