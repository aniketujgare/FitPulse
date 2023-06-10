import 'package:flutter/material.dart';

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - 50);
    path.quadraticBezierTo(
        size.width / 1.3, 40, size.width / 2 - 20, size.height / 2 - 5);
    path.quadraticBezierTo(size.width / 8, size.height - 70, 0, 20);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
