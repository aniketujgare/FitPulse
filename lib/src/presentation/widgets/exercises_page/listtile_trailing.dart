import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../const.dart';

class ListTileTrailing extends StatelessWidget {
  const ListTileTrailing({
    super.key,
    required this.calories,
    this.calFontSize = 18,
  });
  final String calories;
  final double calFontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 60,
        height: double.infinity,
        child: Row(
          children: [
            SvgPicture.asset('assets/svg/fire.svg'),
            const SizedBox(
              width: 10,
            ),
            Text(calories, style: textStyle.copyWith(fontSize: calFontSize))
          ],
        ));
  }
}
