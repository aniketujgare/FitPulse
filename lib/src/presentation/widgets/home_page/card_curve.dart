import 'package:flutter/material.dart';

import 'card_clipper.dart';

class CardCurve extends StatelessWidget {
  const CardCurve({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CardClipper(),
      child: Container(
        height: screenHeight * 0.2,
        width: screenWidth * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffFFFFFF).withOpacity(0.9),
                  Color(0xffFFFFFF).withOpacity(0)
                ]),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
